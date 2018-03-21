//
//  CLTxExtractor.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/12/19.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLTxExtractor.h"
#import "CLConstants.h"
#import "CLTxModel.h"
#import "AFNetworking.h"
#import "NSString+CLURLEncode.h"
#import "CLCommon.h"

#define VD_L_URL @"https://vd.l.qq.com/proxyhttp"

@interface CLTxExtractor ()

@end

@implementation CLTxExtractor

+ (instancetype)sharedInstance {
    static CLTxExtractor *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void)downloadByUrl:(NSString *)url {
    if (!url || [url isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_TX];
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *strResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (!strResponse) {
            [self callbackErrorWithSrc:SRC_TX errCode:-1 requestUrl:url];
            return;
        }

        NSString *pattern = @"vid\"*\\s*:\\s*\"\\s*([^\"]+)\"";
        NSString *vid = [CLCommon regularExpressionForSearchText:strResponse pattern:pattern];
        if (vid) {
            [self downloadByVid:vid];
        } else {
            [self callbackErrorWithSrc:SRC_TX errCode:-1 requestUrl:url];
            return;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_TX errCode:error.code requestUrl:url];
    }];
    
//    [self downloadByVid:@"j0024w39tf3"];
    
//    [self getOnlyVinfoByVid:@"j0024w39tf3" ehost:url];
}

- (void)downloadByVid:(NSString *)vid {
    if (!vid || [vid isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_TX];
        return;
    }
    [self getOnlyVinfoByVid:vid ehost:nil];
}

- (void)getOnlyVinfoByVid:(NSString *)vid ehost:(NSString *)ehost {
    
    CLTxVinfoParam *vinfoParam = [[CLTxVinfoParam alloc]initWithVid:vid ehost:ehost];

    NSDictionary *dicParam = [vinfoParam toDictionary];
    __block NSString *andParam = nil;
    [dicParam enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[NSString class]]) {
//            obj = [((NSString *)obj) cl_urlEncode];
//        }
        NSString *tmp = [NSString stringWithFormat:@"%@=%@",key,obj];
        if (!andParam) {
            andParam = tmp;
        } else {
            andParam = [[andParam stringByAppendingString:@"&"] stringByAppendingString:tmp];
        }
    }];
    
//    NSString *parameters = [NSString stringWithFormat:@"{\"buid\":\"onlyvinfo\",\"vinfoparam\":\"%@\"}",andParam];
    
    CLTxVinfoParamReq *vinfoParaReq = [[CLTxVinfoParamReq alloc]init];
    vinfoParaReq.buid = @"onlyvinfo";
    vinfoParaReq.vinfoparam = andParam;
    NSDictionary *parameters = [vinfoParaReq toDictionary];
    
    NSData *dataBody = [NSJSONSerialization dataWithJSONObject:parameters
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:
                                     [NSURL URLWithString:VD_L_URL]];
    [req setValue:@"application/raw" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:dataBody];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSURLSessionDataTask *task = [manager uploadTaskWithRequest:req fromData:nil progress:^(NSProgress * _Nonnull uploadProgress) {

    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if (!dicResponse) {
                [self callbackErrorWithSrc:SRC_TX errCode:-1 requestUrl:VD_L_URL];
                return;
            }
            NSNumber *errCode = dicResponse[@"errCode"];
            NSString *vinfo = dicResponse[@"vinfo"];
            if (!errCode || errCode.integerValue != 0 || !vinfo) {
                [self callbackErrorWithSrc:SRC_TX errCode:-1 requestUrl:VD_L_URL];
                return;
            }
            NSDictionary *dicVinfo = [NSJSONSerialization JSONObjectWithData:[vinfo dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
            if (!dicVinfo) {
                [self callbackErrorWithSrc:SRC_TX errCode:-1 requestUrl:VD_L_URL];
                return;
            }
            NSError *err = nil;
            CLTxModel *model = [[CLTxModel alloc]initWithDictionary:dicVinfo error:&err];
            if (!model) {
                [self callbackErrorWithSrc:SRC_TX errCode:-1 requestUrl:VD_L_URL];
                return;
            }
            [self.delegate cl_extractorResultWithObject:model src:SRC_TX];
            
        } else {
            NSLog(@"%s | error = %@", __func__, error);
            [self callbackErrorWithSrc:SRC_TX errCode:error.code requestUrl:VD_L_URL];
        }
    }];
    [task resume];

}

@end
