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

static NSString *user_agent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36";
static NSString *MIXER_HOST = @"http://mixer.video.iqiyi.com/jp/mixin/videos/";
static NSString *CACHE_HOST = @"http://cache.m.iqiyi.com/tmts/";

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

- (void)downloadByVid:(NSString *)vid {
    if (!vid || [vid isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_IQIYI];
        return;
    }
    
    [self downloadByUrl:[NSString stringWithFormat:@"http://www.iqiyi.com/v_%@.html", vid]];
   
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
            [self callbackErrorWithSrc:SRC_IQIYI];
            return;
        }
        self.tvid = [self get_tvid_from_html:strResponse];
        self.videoId = [self get_videoId_from_html:strResponse];
        [self get_mixer];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_IQIYI];
    }];
}

- (NSString *)get_tvid_from_html:(NSString *)strResponse {
    if (!strResponse || [strResponse isEqualToString:@""]) {
        return nil;
    }
    NSString *tvid = nil;
    NSArray * patterns = @[
                         @"#curid=(.+)_",
                         @"tvid=([^&]+)",
                         @"data-player-tvid=\"([^\"]+)\"",
                         @"tv(?:i|I)d=(.+?)\\&",
                         @"param\\[\\'tvid\\'\\]\\s*=\\s*\"(.+?)\""
                         ];
    for (NSString *pattern in patterns) {
        NSString *result = [CLCommon regularExpressionForSearchText:strResponse pattern:pattern];
        if (result) {
            tvid = result;
//            break;
        }
    }
    
    return tvid;
}

- (NSString *)get_videoId_from_html:(NSString *)strResponse {
    NSString *videoId = nil;
    
    NSArray * patterns = @[
                           @"#curid=.+_(.*)$",
                           @"vid=([^&]+)",
                           @"data-player-videoid=\"([^\"]+)\"",
                           @"vid=(.+?)\\&",
                           @"param\\[\\'vid\\'\\]\\s*=\\s*\"(.+?)\""
                           ];
    for (NSString *pattern in patterns) {
        NSString *result = [CLCommon regularExpressionForSearchText:strResponse pattern:pattern];
        if (result) {
            videoId = result;
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
            [self callbackErrorWithSrc:SRC_IQIYI];
            return;
        }
        NSString *json = [strResponse stringByReplacingOccurrencesOfString:@"var tvInfoJs=" withString:@""];
        self.iqiyiInfoModel = [[CLIqiyiInfoModel alloc]initWithString:json error:nil];
        [self get_vms];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_IQIYI];
    }];
}

- (void)get_vms {
    long t = [[NSDate date]timeIntervalSince1970];
    NSString *src = @"76f90cbd92f94a2e925d83e8ccd22cb7";
    NSString *key = @"d5fb4bd9d50c4be6948c97edd7254b0e";
    NSString *sc = [[NSString stringWithFormat:@"%ld%@%@",t,key,self.videoId] cl_encryptMD5];
    NSString *url = [NSString stringWithFormat:@"%@%@/%@/?t=%ld&sc=%@&src=%@",CACHE_HOST,self.tvid,self.videoId,t,sc,src];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer setValue:user_agent forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (!dicResponse) {
            [self callbackErrorWithSrc:SRC_IQIYI];
            return;
        }
        NSDictionary *dicData = dicResponse[@"data"];
        if (!dicData) {
            [self callbackErrorWithSrc:SRC_IQIYI];
            return;
        }
        NSError *err = nil;
        CLIqiyiModel *model = [[CLIqiyiModel alloc]initWithDictionary:dicData error:&err];
        if (!model) {
            [self callbackErrorWithSrc:SRC_IQIYI];
            return;
        }
        model.name = self.iqiyiInfoModel.name ?: @"";
        if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithObject:src:)]) {
            [self.delegate cl_extractorResultWithObject:model src:SRC_IQIYI];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_IQIYI];
    }];
    
}



@end
