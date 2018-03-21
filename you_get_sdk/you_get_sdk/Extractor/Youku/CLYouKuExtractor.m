//
//  CLYouKuExtractor.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/23.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLYouKuExtractor.h"
#import "AFNetworking.h"
#import "NSString+CLURLEncode.h"
#import "CLYoukuModel.h"
#import "CLConstants.h"
#import "CLCommon.h"

static NSString *user_agent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36";
static NSString *user_referer = @"http://v.youku.com";
static NSString *cna_url = @"http://log.mmstat.com/eg.js";
static NSString *v_youku_url = @"http://v.youku.com";
static NSString *ups_host = @"https://ups.youku.com/ups/get.json";
//static NSString *ups_host = @"http://acs.youku.com/h5/mtop.youku.play.ups.appinfo.get/1.1/";

@interface CLYouKuExtractor ()

@property(copy, nonatomic) NSString *ccode;

@property(copy, nonatomic) NSString *utid;

@end

@implementation CLYouKuExtractor

+ (instancetype)sharedInstance {
    static CLYouKuExtractor *instance = nil;
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
    self.ua = user_agent;
    self.referer = user_referer;
//    self.ccode = @"0512";
    self.ccode = @"0502";
}

- (void)downloadByVid:(NSString *)vid {
    if (!vid || [vid isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_YOUKU];
        return;
    }
    [self downloadByVid:vid src:@"youku"];
}

- (void)downloadByUrl:(NSString *)url {
    if (!url || [url isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_YOUKU];
        return;
    }
    self.url = url;
    self.vid = nil;
    [self get_vid_from_url:url];
    if (!self.vid) {
        [self get_vid_from_page:url];
    }
    
    if (self.vid) {
        [self downloadByVid:self.vid src:nil];
    }
}

- (void)get_vid_from_url:(NSString *)url {
    if (!url || [url isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_YOUKU errCode:-1 requestUrl:url];
        return;
    }
    
    NSString *b64p = @"([a-zA-Z0-9=]+)";
    NSArray<NSString *> *p_list = @[
                                    [NSString stringWithFormat:@"youku\\.com/v_show/id_%@", b64p],
                                    [NSString stringWithFormat:@"player\\.youku\\.com/player\\.php/sid/%@/v\\.swf", b64p],
                                    [NSString stringWithFormat:@"oade\\.swf\\?VideoIDS=%@", b64p],
                                    [NSString stringWithFormat:@"player\\.youku\\.com/embed/%@", b64p],
                                    [NSString stringWithFormat:@"m\\.youku\\.com/video/id_%@", b64p]
                                    ];
    for (NSString *pattern in p_list) {
        NSString *result = [CLCommon regularExpressionForSearchText:url pattern:pattern];
        if (result) {
            self.vid = result;
            break;
        }
    }
}

- (void)get_vid_from_page:(NSString *)url {
    if (!url || [url isEqualToString:@""]) {
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *strResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSString *pattern = @"videoId2:\"([A-Za-z0-9=]+)\"";
        NSString *result = [CLCommon regularExpressionForSearchText:strResponse pattern:pattern];
        if (result) {
            self.vid = result;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
    }];
}

- (void)downloadByVid:(NSString *)vid src:(NSString *)src {
    self.vid = vid;
    if ([@"tudou" isEqualToString:src]) {
//        self.ccode = @"050F";
        self.ccode = @"0512";
    }

    [self fetch_cna];
}

- (void)fetch_cna {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer setValue:self.referer forHTTPHeaderField:@"Referer"];
    [manager.requestSerializer setValue:self.ua forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:cna_url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *headers = ((NSHTTPURLResponse*)task.response).allHeaderFields;
        NSLog(@"%@",headers);
        self.utid = [headers objectForKey:@"Etag"];
        if (self.utid) {
            //通过Etag找utid
            self.utid = [self.utid stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        } else {
            //通过set-cookie
            NSString *cookie = [headers objectForKey:@"set-cookie"] ?: [headers objectForKey:@"Set-Cookie"];
            NSString *n_v = [cookie componentsSeparatedByString:@";"][0];
            NSArray *separatedArr = [n_v componentsSeparatedByString:@"="];
            NSString *name = separatedArr[0];
            NSString *value = separatedArr[1];
            if ([@"cna" isEqualToString:name]) {
                self.utid = [self quote_cna:value];
            }
        }
        
        if (!self.utid) {
            //实在找不到,设置默认值
            self.utid = [self quote_cna:@"DOG4EdW4qzsCAbZyXbU+t7Jt"];
        }

        [self youku_ups];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        self.utid = [self quote_cna:@"DOG4EdW4qzsCAbZyXbU+t7Jt"];
        [self youku_ups];
    }];
    
}

- (NSString *)quote_cna:(NSString *)val {
    if ([val containsString:@"%"]) {
        return val;
    } else {
        return [val cl_urlEncode];
    }
}

- (void)youku_ups {
    [self get_ups];
}

- (void)get_ups {
    //    NSString *strUrl = [NSString stringWithFormat:@"%@?vid=%@&ccode=%@&client_ip=192.168.1.1&utid=%@&client_ts=%d&ups_client_netip=ca698922", ups_host, self.vid, self.ccode, self.utid, (int)[[NSDate date]timeIntervalSince1970]];
    
    NSString *ckey = @"DIl58SLFxFNndSV1GFNnMQVYkx1PP5tKe1siZu/86PR1u/Wh1Ptd+WOZsHHWxysSfAOhNJpdVWsdVJNsfJ8Sxd8WKVvNfAS8aS8fAOzYARzPyPc3JvtnPHjTdKfESTdnuTW6ZPvk2pNDh4uFzotgdMEFkzQ5wZVXl2Pf1/Y6hLK0OnCNxBj3+nb0v72gZ6b0td+WOZsHHWxysSo/0y9D2K42SaB8Y/+aD2K42SaB8Y/+ahU+WOZsHcrxysooUeND";

    NSString *strUrl = [NSString stringWithFormat:@"%@?vid=%@&ccode=%@&client_ip=0.0.0.0&utid=%@&client_ts=%d&ckey=%@", ups_host, self.vid, self.ccode, self.utid, (int)[[NSDate date]timeIntervalSince1970], [ckey cl_urlEncode]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer setValue:self.referer forHTTPHeaderField:@"Referer"];
    [manager.requestSerializer setValue:self.ua forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:strUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *headers = ((NSHTTPURLResponse*)task.response).allHeaderFields;
//        NSLog(@"%@",headers);
        NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (!dicResponse) {
            [self callbackErrorWithSrc:SRC_YOUKU errCode:-1 requestUrl:strUrl];
            return;
        }
        NSDictionary *datas = dicResponse[@"data"];
        if (!datas) {
            [self callbackErrorWithSrc:SRC_YOUKU errCode:-1 requestUrl:strUrl];
            return;
        }
        
        CLYoukuModel *youkuModel = [[CLYoukuModel alloc]initWithDictionary:datas error:nil];
        if (!youkuModel) {
            [self callbackErrorWithSrc:SRC_YOUKU errCode:-1 requestUrl:strUrl];
            return;
        }

        for (int i = 0; i < youkuModel.stream.count; i++) {
            CLYoukuStreamModel *model = youkuModel.stream[i];
            NSLog(@"优酷解析成功：name = %@ | width = %d | height = %d \r m3u8_url = %@\r\r", youkuModel.video[@"title"], model.width.intValue, model.height.intValue, model.m3u8_url);
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithObject: src:)]) {
            [self.delegate cl_extractorResultWithObject:youkuModel src:SRC_YOUKU];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_YOUKU errCode:error.code requestUrl:strUrl];
    }];
}


@end
