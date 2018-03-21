//
//  CLTuDouExtractor.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/23.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLTuDouExtractor.h"
#import "CLCommon.h"
#import "AFNetworking.h"
#import "CLYouKuExtractor.h"
#import "CLConstants.h"

@implementation CLTuDouExtractor

+ (instancetype)sharedInstance {
    static CLTuDouExtractor *instance = nil;
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

- (void)downloadByUrl:(NSString *)url {
    NSLog(@"%s | url = %@",__func__,url);
    if (!url || [url isEqualToString:@""]) {
        return;
    }
    
    if ([url containsString:@"acfun.tudou.com"]) {
        NSLog(@"%s | 土豆acfunc网站", __func__);
    } else {
        NSString *pattern = @"http://www.tudou.com/v/([^/]+)/";
        NSString *result = [CLCommon regularExpressionForSearchText:url pattern:pattern];
        if (result) {
            
        } else {
            [self getContentWithUrl:url];
        }
    }
}

- (void)getContentWithUrl:(NSString *)url {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *strResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        [self parseContentWithResponse:strResponse];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_TUDOU errCode:error.code requestUrl:url];
    }];
}

- (void)parseContentWithResponse:(NSString *)response {
    //解析标题
    NSString *pattern = @"\\Wkw\\s*[:=]\\s*[\\'\\\"]([^\\n]+?)\\'\\s*\\n";
    NSString *result = [CLCommon regularExpressionForSearchText:response pattern:pattern];
    if (result) {
        NSString *title = [result stringByReplacingOccurrencesOfString:@"\\'" withString:@"\'"];
        NSLog(@"%s | title = %@", __func__, title);
    }
    
    //解析是否为优酷
    pattern = @"vcode\\s*[:=]\\s*\\'([^\\']+)\\'";
    result = [CLCommon regularExpressionForSearchText:response pattern:pattern];
    if (!result) {
        pattern = @"viden\\s*[:=]\\s*\\\"([\\w+/=]+)\\\"";
        result = [CLCommon regularExpressionForSearchText:response pattern:pattern];
    }
    if (result) {
        [CLYouKuExtractor sharedInstance].delegate = self.delegate;
        [[CLYouKuExtractor sharedInstance] downloadByVid:result src:@"tudou"];
        return;
    }
    
    //解析是否为土豆
    pattern = @"iid\\s*[:=]\\s*(\\d+)";
    result = [CLCommon regularExpressionForSearchText:response pattern:pattern];
    if (result) {
        NSLog(@"%s | 土豆 | vid = %@", __func__, result);
        return;
    }
}

- (void)downloadByVid:(NSString *)vid {
    if (!vid || [vid isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_TUDOU];
        return;
    }
    [CLYouKuExtractor sharedInstance].delegate = self.delegate;
    [[CLYouKuExtractor sharedInstance] downloadByVid:vid src:@"tudou"];
}



@end
