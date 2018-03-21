//
//  CLMgtvExtractor.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/25.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLMgtvExtractor.h"
#import "CLCommon.h"
#import "CLMgtvModel.h"
#import "AFNetworking.h"
#import "CLExtractorModel.h"
#import "CLConstants.h"

static NSString *api_endpoint = @"http://pcweb.api.mgtv.com/player/video?video_id=";

@interface CLMgtvExtractor ()

@property(strong, nonatomic) CLMgtvModel *mgtvModel;

@property(copy, nonatomic) NSString *url;
@property(copy, nonatomic) NSString *vid;
@property(copy, nonatomic) NSString *title;
@property(copy, nonatomic) NSString *domain;

@property(copy, nonatomic) NSMutableDictionary *stream_available;
@property(copy, nonatomic) NSMutableArray<StreamType *> *stream_types;
@property(copy, nonatomic) NSMutableDictionary *id_dic;

@property(copy, nonatomic) NSString * quality_id;
@property(copy, nonatomic) NSString * container;
@property(copy, nonatomic) NSString * video_profile;
@property(copy, nonatomic) NSString * m3u_url;
@property(copy, nonatomic) NSString * base_url;
@property(copy, nonatomic) NSMutableArray *segment_list;
@property(copy, nonatomic) NSMutableDictionary *streams;

@property(assign, nonatomic) long segments_size;
@property(assign, nonatomic) NSInteger cur_stream_index;
@property(assign, nonatomic) NSInteger try_get_real_url_time;

@end

@implementation CLMgtvExtractor

- (NSMutableArray<StreamType *> *)stream_types {
    if (!_stream_types) {
        _stream_types = [NSMutableArray array];
    }
    return _stream_types;
}

- (NSMutableDictionary *)id_dic {
    if (!_id_dic) {
        _id_dic = [NSMutableDictionary dictionary];
    }
    return _id_dic;
}

- (NSMutableDictionary *)stream_available {
    if (!_stream_available) {
        _stream_available = [NSMutableDictionary dictionary];
    }
    return _stream_available;
}

- (NSMutableArray *)segment_list {
    if (!_segment_list) {
        _segment_list = [NSMutableArray array];
    }
    return _segment_list;
}

- (NSMutableDictionary *)streams {
    if (!_streams) {
        _streams = [NSMutableDictionary dictionary];
    }
    return _streams;
}

+ (instancetype)sharedInstance {
    static CLMgtvExtractor *instance = nil;
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
    
    StreamType *hd = [[StreamType alloc]initWithId:@"hd" container:@"ts" videoProfile:@"超清"];
    StreamType *sd = [[StreamType alloc]initWithId:@"sd" container:@"ts" videoProfile:@"高清"];
    StreamType *ld = [[StreamType alloc]initWithId:@"ld" container:@"ts" videoProfile:@"标清"];
    
    [self.stream_types addObject:hd];
    [self.stream_types addObject:sd];
    [self.stream_types addObject:ld];
    
    [self.id_dic setObject:@"hd" forKey:@"超清"];
    [self.id_dic setObject:@"sd" forKey:@"高清"];
    [self.id_dic setObject:@"ld" forKey:@"标清"];
}

- (void)downloadByUrl:(NSString *)url {
    if (!url || [url isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_MGTV];
        return;
    }
    self.url = url;
    self.vid = [self get_vid_from_url:url];
    [self downloadByVid:self.vid];
}

- (void)downloadByVid:(NSString *)vid {
    if (!vid || [vid isEqualToString:@""]) {
        [self callbackErrorWithSrc:SRC_MGTV];
        return;
    }
    [self get_pcweb_api:vid];
}

- (NSString *)get_vid_from_url:(NSString *)url {
    
//    NSString *pattern = @"https://www.mgtv.com/(?:b|l)/\\d+/(\\d+).html";
    NSString *pattern = @"/\\d+/(\\d+).html";
    NSString *vid = [CLCommon regularExpressionForSearchText:url pattern:pattern];
    if (!vid) {
        pattern = @"https://www.mgtv.com/hz/bdpz/\\d+/(\\d+).html";
        vid = [CLCommon regularExpressionForSearchText:url pattern:pattern];
    }
    if (!vid) {
        pattern = @"/s/(\\d+).html";
        vid = [CLCommon regularExpressionForSearchText:url pattern:pattern];
    }
    if (!vid) {
        pattern = @"mgtv.com/#/(?:b|l)/\\d+/(\\d+)";
        vid = [CLCommon regularExpressionForSearchText:url pattern:pattern];
    }
    return vid;
}

- (void)get_pcweb_api:(NSString *)vid {
    NSString *api_url = [NSString stringWithFormat:@"%@%@",api_endpoint,vid];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:api_url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (!dicResponse) {
            [self callbackErrorWithSrc:SRC_MGTV errCode:-1 requestUrl:api_url];
            return;
        }
        NSError *err = nil;
        CLMgtvModel *model = [[CLMgtvModel alloc]initWithDictionary:dicResponse error:&err];
        self.mgtvModel = model;
        [self parse_streamWithMgtvModel:model];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_MGTV errCode:error.code requestUrl:api_url];
    }];
}

- (void)parse_streamWithMgtvModel:(CLMgtvModel *)model {
    if (!model || !model.data) {
        [self callbackErrorWithSrc:SRC_MGTV];
        return;
    }

    self.title = model.data.info.title;
    self.domain = model.data.stream_domain[0];
    
    for (CLMgtvStreamModel *stream in model.data.stream) {
        [self.stream_available setObject:stream.url forKey:stream.name];
    }
    
    self.cur_stream_index = 0;
    [self parse_stream_impl];
}

- (void)parse_stream_impl {
    if (self.cur_stream_index < self.stream_types.count) {
        StreamType *s = self.stream_types[self.cur_stream_index];
        if ([self.stream_available objectForKey:s.video_profile]) {
            
            self.quality_id = [self.id_dic objectForKey:s.video_profile];
            NSString *url = [self.stream_available objectForKey:s.video_profile];
            if (url && ![url isEqualToString:@""]) {
                NSString *url2 = [self.domain stringByAppendingString:[url stringByReplacingOccurrencesOfString:@"(\\&arange\\=\\d+)" withString:@""]];
                self.container = s.container;
                self.video_profile = s.video_profile;
                [self get_mgtv_real_url:url2];
            }
        }
    }
}

- (void)get_mgtv_real_url:(NSString *)url {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (!dicResponse) {
            [self callbackErrorWithSrc:SRC_MGTV errCode:-1 requestUrl:url];
            return;
        }
        NSError *err = nil;
        CLMgtvRealModel *model = [[CLMgtvRealModel alloc]initWithDictionary:dicResponse error:&err];
        self.m3u_url = model.info;
        NSURL *u = [NSURL URLWithString:self.m3u_url];
        NSRange range = [u.path rangeOfString:@"mp4/"];
        NSString *path = [u.path substringToIndex:range.location+range.length];
        self.base_url = [NSString stringWithFormat:@"%@://%@%@",[u scheme], [u host], path];
        [self get_m3u:model.info];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_MGTV errCode:error.code requestUrl:url];
    }];
}

- (void)get_m3u:(NSString *)url {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *strResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        [self parse_m3u:strResponse];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%s | error = %@", __func__, error);
        [self callbackErrorWithSrc:SRC_MGTV errCode:error.code requestUrl:url];
    }];
}

- (void)parse_m3u:(NSString *)content {
    NSArray *data = [content componentsSeparatedByString:@"\\s+"];
    for (int i = 0; i < data.count; i++) {
        if (![data[i] hasPrefix:@"#"]) {
            [self.segment_list addObject:[self.base_url stringByAppendingString:data[i]]];
        } else if ([data[i] hasPrefix:@"#EXT-MGTV-File-SIZE:"]) {
            NSRange range = [data[i] rangeOfString:@":"];
            NSString *size = [data[i] substringFromIndex:range.location+range.length];
            self.segments_size += size.longLongValue;
        }
    }
    [self generate_result];
}

- (void)generate_result {
    MyResult *res = [[MyResult alloc]init];
    res.m3u8_url = self.m3u_url;
    res.container = self.container;
    res.video_profile = self.video_profile;
    res.size = @(self.segments_size);
    
    //get the piesces 算了，不拼接pieces了
    [self.streams setObject:res forKey:self.quality_id];
    self.cur_stream_index++;
    if (self.cur_stream_index < self.stream_types.count) {
        [self parse_stream_impl];
    } else {
        
        NSMutableArray *play_urls = [NSMutableArray array];
        for (MyResult *value in [self.streams allValues]) {
            [play_urls addObject:value];
        }

        self.mgtvModel.play_urls = [NSArray arrayWithArray:play_urls];

        if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithObject:src:)]) {
            [self.delegate cl_extractorResultWithObject:self.mgtvModel src:SRC_MGTV];
        }
    }
}

- (CLExtractorModel *)convertToExtractorModelWithMgtv:(CLMgtvModel *)mgtvModel {
    CLExtractorModel *extractorModel = [[CLExtractorModel alloc]init];
    
    return extractorModel;
}


@end
