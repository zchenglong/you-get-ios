//
//  CLIqiyiExtractor.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/11/3.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLIqiyiExtractor.h"
#import "AFNetworking.h"
#import "CLCommon.h"
#import "CLIqiyiModel.h"
#import "NSString+CLURLEncode.h"
#import "CLConstants.h"
#import "cmd5xTool.h"

static NSString *user_agent = @"Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1";
static NSString *MIXER_HOST = @"http://mixer.video.iqiyi.com/jp/mixin/videos/";
static NSString *CACHE_HOST = @"http://cache.m.iqiyi.com";

@interface CLIqiyiExtractor ()

@property(strong, nonatomic) NSString *tvid;
@property(strong, nonatomic) NSString *videoId;
@property(strong, nonatomic) CLIqiyiInfoModel *iqiyiInfoModel;

@end

@implementation CLIqiyiExtractor

+ (instancetype)sharedInstance {
    static CLIqiyiExtractor *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void)downloadByTvid:(NSString *)tvid vid:(NSString *)vid {
    self.tvid = tvid;
    self.videoId = vid;
    [self get_mixer];
}

- (void)downloadByVid:(NSString *)vid {
    if (!vid || [vid isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_IQIYI];
        return;
    }
    if ([vid hasPrefix:@"v_"] || [vid hasPrefix:@"w_"]) {
        [self downloadByUrl:[NSString stringWithFormat:@"http://www.iqiyi.com/%@.html", vid]];
    } else {
        [self downloadByUrl:[NSString stringWithFormat:@"http://www.iqiyi.com/v_%@.html", vid]];
    }
}

- (void)downloadByUrl:(NSString *)url {
    if (!url || [url isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_IQIYI];
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer setValue:user_agent forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *strResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (!strResponse) {
            [self callbackErrorWithSrc:SRC_IQIYI errCode:-1 requestUrl:url];
            return;
        }
        self.tvid = [self get_tvid_from_html:strResponse];
        self.videoId = [self get_videoId_from_html:strResponse];
        [self get_mixer];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_IQIYI errCode:error.code requestUrl:url];
    }];
}

- (NSString *)get_tvid_from_html:(NSString *)strResponse {
    if (!strResponse || [strResponse isEqualToString:@""]) {
        return nil;
    }
    NSString *tvid = nil;
    NSArray * patterns = @[
//                         @"#curid=(.+)_",
//                         @"tvid=([^&]+)",
//                         @"data-player-tvid=\"([^\"]+)\"",
//                         @"tv(?:i|I)d=(.+?)\\&",
//                         @"param\\[\\'tvid\\'\\]\\s*=\\s*\"(.+?)\""
            @"playInfo.tvid = \"\\d{9}\";"
    ];
    for (NSString *pattern in patterns) {
        NSString *result = [CLCommon regularExpressionForSearchText:strResponse pattern:pattern];
        if (result) {
            tvid = [[result stringByReplacingOccurrencesOfString: @"playInfo.tvid = \"" withString: @""] stringByReplacingOccurrencesOfString: @"\";" withString: @""];
//            break;
        }
    }
    
    return tvid;
}

- (NSString *)get_videoId_from_html:(NSString *)strResponse {
    NSString *videoId = nil;
    
    NSArray * patterns = @[
//                           @"#curid=.+_(.*)$",
//                           @"vid=([^&]+)",
//                           @"data-player-videoid=\"([^\"]+)\"",
//                           @"vid=(.+?)\\&",
//                           @"param\\[\\'vid\\'\\]\\s*=\\s*\"(.+?)\""
            @"playInfo.vid = \"\\w{32}\";"
    ];
    for (NSString *pattern in patterns) {
        NSString *result = [CLCommon regularExpressionForSearchText:strResponse pattern:pattern];
        if (result) {
            videoId = [[result stringByReplacingOccurrencesOfString: @"playInfo.vid = \"" withString: @""] stringByReplacingOccurrencesOfString: @"\";" withString: @""];
//            break;
        }
    }
    
    return videoId;
}

- (void)get_mixer {
    NSString *url = [NSString stringWithFormat:@"%@%@",MIXER_HOST,self.tvid];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer setValue:user_agent forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *strResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (!strResponse) {
            [self callbackErrorWithSrc:SRC_IQIYI errCode:-1 requestUrl:url];
            return;
        }
        NSString *json = [strResponse stringByReplacingOccurrencesOfString:@"var tvInfoJs=" withString:@""];
        self.iqiyiInfoModel = [[CLIqiyiInfoModel alloc]initWithString:json error:nil];
        [self get_vms];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_IQIYI errCode:error.code requestUrl:url];
    }];
}

- (void)get_vms {
    double t = [[NSDate date]timeIntervalSince1970] * 1000;
    /**OLD--计算URL*/
//    NSString *src = @"76f90cbd92f94a2e925d83e8ccd22cb7";
//    NSString *key = @"d5fb4bd9d50c4be6948c97edd7254b0e";
//    NSString *sc = [[NSString stringWithFormat:@"%lf%@%@",t,key,self.videoId] cl_encryptMD5];
//    NSString *url = [NSString stringWithFormat:@"%@/tmts/%@/%@/?t=%ld&sc=%@&src=%@",CACHE_HOST,self.tvid,self.videoId,t,sc,src];
    
    /**NEW--计算URL*/
    NSString *qyid = [[NSString stringWithFormat:@"%@%@%f%lf",user_agent,@""/*cookie*/, (float)arc4random_uniform(100)/100, t] cl_encryptMD5];
    // without cookie / platform
    /**
     * uid:
     * cupid:
     * ios:     "qc_100001_100102",
     * android: "qc_100001_100186",
     * agenttype:
     * ios:     12
     * android: 13
     * rate:
     *  "极速":   "96",
     *  "流畅":   "1",
     *  "高清":   "2"
     **/
    NSString * url = [NSString stringWithFormat:@"/jp/tmts/%@/%@/?"
                                                        "uid=%@"
                                                        "&cupid=%@"
                                                        "&platform=%@"
                                                        "&qyid=%@"
                                                        "&agenttype=%@"
                                                        "&type=%@"
                                                        "&nolimit=%@"
                                                        "&k_ft1=%@"
                                                        "&rate=%@"
                                                        "&sgti=%@"
                                                        "&codeflag=%@"
                                                        "&preIdAll=%@"
                                                        "&dfp=%@"
                                                        "&qd_v=%@"
                                                        "&qdy=%@"
                                                        "&qds=%@"
                                                        "&tm=%@"
                                                        "&src=%@"
                                                        "&callback=%@",
                                                _tvid,
                                                _videoId,
                                                @"",
                                                @"qc_100001_100102",
                                                @"h5",
                                                qyid,
                                                @"12",
                                                @"m3u8",
                                                @"",
                                                @"8",
                                                @"1",
                                                [NSString stringWithFormat:@"%@_%@_%lf", @"12", qyid, t],
                                                @"1",
                                                @"",
                                                @""/*window.name*/,
                                                @"1",
                                                @"i",
                                                @"0",
                                                @((NSInteger) floor(t / 1000)),
                                                @"02020031010000000000",
                                                @"tmtsCallback"
    ];

    NSString * vf = [cmd5xTool cmd5x:url];
    url = [NSString stringWithFormat:@"%@%@%@",CACHE_HOST, url, [NSString stringWithFormat:@"&vf=%@", vf]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer setValue:user_agent forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSString * response = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        response = [[response stringByReplacingOccurrencesOfString:@"try{tmtsCallback(" withString:@""] stringByReplacingOccurrencesOfString:@");}catch(e){};" withString:@""];

        NSData * jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];

        NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        if (!dicResponse) {
            [self callbackErrorWithSrc:SRC_IQIYI errCode:-1 requestUrl:url];
            return;
        }
        NSDictionary *dicData = dicResponse[@"data"];
        if (!dicData) {
            [self callbackErrorWithSrc:SRC_IQIYI errCode:-1 requestUrl:url];
            return;
        }
        NSError *err = nil;
        CLIqiyiModel *model = [[CLIqiyiModel alloc]initWithDictionary:dicData error:&err];
        if (!model) {
            [self callbackErrorWithSrc:SRC_IQIYI errCode:-1 requestUrl:url];
            return;
        }
        model.name = self.iqiyiInfoModel.name ?: @"";
        if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithObject:src:)]) {
            [self.delegate cl_extractorResultWithObject:model src:SRC_IQIYI];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_IQIYI errCode:error.code requestUrl:url];
    }];
    
}



@end
