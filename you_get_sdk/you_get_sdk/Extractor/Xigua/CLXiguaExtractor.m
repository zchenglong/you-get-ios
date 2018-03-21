//
//  CLXiguaExtractor.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/31.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLXiguaExtractor.h"
#import "AFNetworking.h"
#import "CLXiguaModel.h"
#import "CLCommon.h"
#import "NSData+CRC32.h"
#import "CLXiguaModel.h"
#import "CLConstants.h"

static NSString *user_agent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36";

static NSString *base_url = @"https://ib.365yg.com/video/urls/v/1/toutiao/mp4/";
static NSString *base_crc_path = @"/video/urls/v/1/toutiao/mp4/";

@interface CLXiguaExtractor ()

@property(strong, nonatomic) NSString *video_id;

@end

@implementation CLXiguaExtractor

+ (instancetype)sharedInstance {
    static CLXiguaExtractor *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self initDatas];
    }
    return self;
}

- (void)initDatas {
    
}

- (void)downloadByVid:(NSString *)vid {
    if (!vid || [vid isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_XIGUA];
        return;
    }
//    NSString *url = [NSString stringWithFormat:@"https://www.ixigua.com/group/%@",vid];
    
//    NSString *url = [NSString stringWithFormat:@"https://www.m.365yg.com/i%@",vid];
//    [self downloadByUrl:url];
    
    NSString *url = [NSString stringWithFormat:@"https://m.365yg.com/i%@/info/",vid];
    [self get_video_id_url:url];
}


- (void)downloadByUrl:(NSString *)url {
    if (!url || [url isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_XIGUA];
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:user_agent forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *strResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (!strResponse) {
            [self callbackErrorWithSrc:SRC_XIGUA errCode:-1 requestUrl:url];
            return;
        }
        self.video_id = [self get_video_id_html:strResponse];
        [self get_ib];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_XIGUA errCode:error.code requestUrl:url];
    }];
}

- (void)get_video_id_url:(NSString *)url {

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicData = (NSDictionary*)responseObject;
        if (!dicData) {
            [self callbackErrorWithSrc:SRC_XIGUA errCode:-1 requestUrl:url];
            return;
        }
        NSDictionary *data = dicData[@"data"];
        if (!data) {
            [self callbackErrorWithSrc:SRC_XIGUA errCode:-1 requestUrl:url];
            return;
        }
        
        self.video_id = data[@"video_id"];
        [self get_ib];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_XIGUA errCode:error.code requestUrl:url];
    }];
}

- (NSString *)get_video_id_html:(NSString *)strResponse {

    NSString *vid = nil;
//    NSString *pattern = @"playerInfo: \\{[^`] *\\},";
    NSString *pattern = @"player=\\{[^`]*\\},";
    NSString *result = [CLCommon regularExpressionForSearchText:strResponse pattern:pattern];

    result = [result componentsSeparatedByString:@"};"][0];
    result = [result substringFromIndex:[result rangeOfString:@"videoid"].location];
    result = [result componentsSeparatedByString:@","][0];
    result = [result componentsSeparatedByString:@":"][1];
    result = [result stringByReplacingOccurrencesOfString:@"'" withString:@""];
    result = [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if (result) {
        vid = result;
    }
    return vid;
}

- (void)get_ib {
    if (!self.video_id) {
        [self callbackErrorWithSrc:SRC_XIGUA];
        return;
    }
    NSString *r = [NSNumber numberWithInt:arc4random()].stringValue;
    NSString *base_crc32 = [NSString stringWithFormat:@"%@%@?r=%@",base_crc_path,self.video_id,r];
    uint32_t its = [[base_crc32 dataUsingEncoding:NSUTF8StringEncoding] crc32];
    NSString *s = @(its).stringValue;
    NSString *url = [NSString stringWithFormat:@"%@%@?r=%@&s=%@",base_url,self.video_id,r,s];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (!dicResponse) {
            [self callbackErrorWithSrc:SRC_XIGUA errCode:-1 requestUrl:url];
            return;
        }
        NSDictionary *data = dicResponse[@"data"];
        if (!data) {
            [self callbackErrorWithSrc:SRC_XIGUA errCode:-1 requestUrl:url];
            return;
        }
      
        NSError *err = nil;
        CLXiguaModel *xiguaModel = [[CLXiguaModel alloc]initWithDictionary:data error:&err];
        if (!xiguaModel) {
            [self callbackErrorWithSrc:SRC_XIGUA errCode:-1 requestUrl:url];
            return;
        }
        NSMutableArray<CLXiguaVideo *> *xiguaVideos = [NSMutableArray array];
        for (NSDictionary *item in [xiguaModel.video_list allValues]) {
            //转换main_url
            NSString *base64Main_url = item[@"main_url"];
            NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64Main_url options:0];
            NSString *decodedMain_url = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
            //生成video对象
            NSError *err = nil;
            CLXiguaVideo *xiguaVideo = [[CLXiguaVideo alloc]initWithDictionary:item error:&err];
            xiguaVideo.main_url = decodedMain_url;
            [xiguaVideos addObject:xiguaVideo];
        }
        
        xiguaModel.videos = [NSArray arrayWithArray:xiguaVideos];
        if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithObject:src:)]) {
            [self.delegate cl_extractorResultWithObject:xiguaModel src:SRC_XIGUA];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_XIGUA errCode:error.code requestUrl:url];
    }];
}

@end
