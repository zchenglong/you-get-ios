//
//  CLExtractorManager.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/25.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLExtractorManager.h"
#import "CLYouKuExtractor.h"
#import "CLTuDouExtractor.h"
#import "CLMgtvExtractor.h"
#import "CLXiguaExtractor.h"
#import "CLIqiyiExtractor.h"
#import "CLTxExtractor.h"
#import "CLExtractorModel.h"
#import "CLYoukuModel.h"
#import "CLMgtvModel.h"
#import "CLXiguaModel.h"
#import "CLIqiyiModel.h"
#import "CLTxModel.h"
#import "AFNetworking.h"


@interface CLExtractorManager () <CLExtractorDelegate>

@end

@implementation CLExtractorManager

+ (instancetype)sharedInstance {
    static CLExtractorManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

#pragma mark - PUBLIC
- (void)downloadByUrl:(NSString *)url src:(NSString *)src {
    if ([SRC_YOUKU isEqualToString:src]) {
        [CLYouKuExtractor sharedInstance].delegate = self;
        [[CLYouKuExtractor sharedInstance] downloadByUrl:url];
    } else if ([SRC_TUDOU isEqualToString:src]) {
        [CLTuDouExtractor sharedInstance].delegate = self;
        [[CLTuDouExtractor sharedInstance] downloadByUrl:url];
    } else if ([SRC_MGTV isEqualToString:src]) {
        [CLMgtvExtractor sharedInstance].delegate = self;
        [[CLMgtvExtractor sharedInstance] downloadByUrl:url];
    } else if ([SRC_XIGUA isEqualToString:src]) {
        [CLXiguaExtractor sharedInstance].delegate = self;
        [[CLXiguaExtractor sharedInstance] downloadByUrl:url];
    } else if ([SRC_IQIYI isEqualToString:src]) {
        [CLIqiyiExtractor sharedInstance].delegate = self;
        [[CLIqiyiExtractor sharedInstance] downloadByUrl:url];
    } else if ([SRC_TX isEqualToString:src]) {
        [CLTxExtractor sharedInstance].delegate = self;
        [[CLTxExtractor sharedInstance] downloadByUrl:url];
    } else {
        [self.delegate cl_extractorResultWithObject:nil src:src];
    }
}

- (void)downloadByVid:(NSString *)vid src:(NSString *)src {
    if ([SRC_YOUKU isEqualToString:src]) {
        [CLYouKuExtractor sharedInstance].delegate = self;
        [[CLYouKuExtractor sharedInstance] downloadByVid:vid];
    } else if ([SRC_TUDOU isEqualToString:src]) {
        [CLTuDouExtractor sharedInstance].delegate = self;
        [[CLTuDouExtractor sharedInstance] downloadByVid:vid];
    } else if ([SRC_MGTV isEqualToString:src]) {
        [CLMgtvExtractor sharedInstance].delegate = self;
        [[CLMgtvExtractor sharedInstance] downloadByVid:vid];
    } else if ([SRC_XIGUA isEqualToString:src]) {
        [CLXiguaExtractor sharedInstance].delegate = self;
        [[CLXiguaExtractor sharedInstance] downloadByVid:vid];
    } else if ([SRC_IQIYI isEqualToString:src]) {
        [CLIqiyiExtractor sharedInstance].delegate = self;
        [[CLIqiyiExtractor sharedInstance] downloadByVid:vid];
    } else if ([SRC_TX isEqualToString:src]) {
        [CLTxExtractor sharedInstance].delegate = self;
        [[CLTxExtractor sharedInstance] downloadByVid:vid];
    } else {
        [self.delegate cl_extractorResultWithObject:nil src:src];
    }
}

- (void)downloadByTvid:(NSString *)tvid vid:(NSString*)vid src:(NSString *)src {
    if ([SRC_IQIYI isEqualToString:src]) {
        [CLIqiyiExtractor sharedInstance].delegate = self;
        [[CLIqiyiExtractor sharedInstance] downloadByTvid:tvid vid:vid];
    } else {
        [self.delegate cl_extractorResultWithObject:nil src:src];
    }
}

#pragma mark - DELEGATE
- (void)cl_extractorResultWithObject:(id)obj src:(NSString *)src {
    if (!obj) {
        [self.delegate cl_extractorResultWithObject:nil src:src];
        return;
    }
    CLExtractorModel *exModel = nil;
    if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithObject:src:)]) {
        if ([SRC_YOUKU isEqualToString:src] || [SRC_TUDOU isEqualToString:src]) {
            exModel = [self convertToExtractorModelWithYouku:obj];
        } else if ([SRC_MGTV isEqualToString:src]) {
            exModel = [self convertToExtractorModelWithMgtv:obj];
        } else if ([SRC_XIGUA isEqualToString:src]) {
            exModel = [self convertToExtractorModelWithXigua:obj];
        } else if ([SRC_IQIYI isEqualToString:src]) {
            exModel = [self convertToExtractorModelWithIqiyi:obj];
        } else if ([SRC_TX isEqualToString:src]) {
            exModel = [self convertToExtractorModelWithTx:obj];
        }
        [self.delegate cl_extractorResultWithObject:exModel src:src];
    }
}

- (void)cl_extractorResultWithErrorCode:(NSString *)errorCode requestUrl:(NSString *)requestUrl src:(NSString *)src {
    
    [self.delegate cl_extractorResultWithObject:nil src:src];
    
    //错误上报
    NSDictionary *dicData = @{
        @"source":src,
        @"err_code":errorCode,
        @"request_url":requestUrl,
        @"client_type":@2
    };
    [self feedbackWithInfo:dicData];
}

#pragma mark - PRIVATE
- (CLExtractorModel *)convertToExtractorModelWithYouku:(CLYoukuModel *)model {
    CLExtractorModel *exModel = [[CLExtractorModel alloc]init];
    exModel.title = model.show.title;
    
    NSMutableArray *tmpStreams = [NSMutableArray array];
    for (int i = 0; i < model.stream.count; i++) {
        CLYoukuStreamModel *youkuStream = model.stream[i];
        CLEStream *clStream = [[CLEStream alloc]init];
        clStream.play_url = youkuStream.m3u8_url;
        clStream.definition = [NSString stringWithFormat:@"%@x%@",youkuStream.width,youkuStream.height];
        [tmpStreams addObject:clStream];
    }
    exModel.streams = [NSArray arrayWithArray:tmpStreams];
    
    return exModel;
    
}

- (CLExtractorModel *)convertToExtractorModelWithMgtv:(CLMgtvModel *)model {
    CLExtractorModel *exModel = [[CLExtractorModel alloc]init];
    exModel.title = model.data.info.title;
    
    NSMutableArray *tmpStreams = [NSMutableArray array];
    for (int i = 0; i < model.play_urls.count; i++) {
        MyResult *mgStream = model.play_urls[i];
        CLEStream *clStream = [[CLEStream alloc]init];
        clStream.play_url = mgStream.m3u8_url;
        clStream.definition = mgStream.video_profile;
        [tmpStreams addObject:clStream];
    }
    exModel.streams = [NSArray arrayWithArray:tmpStreams];
    
    return exModel;
}

- (CLExtractorModel *)convertToExtractorModelWithXigua:(CLXiguaModel *)model {
    CLExtractorModel *exModel = [[CLExtractorModel alloc]init];
    exModel.title = @"";
    
    NSMutableArray *tmpStreams = [NSMutableArray array];
    for (int i = 0; i < model.videos.count; i++) {
        CLXiguaVideo *xgVideo = model.videos[i];
        CLEStream *clStream = [[CLEStream alloc]init];
        clStream.play_url = xgVideo.main_url;
        clStream.definition = xgVideo.definition;
        [tmpStreams addObject:clStream];
    }
    exModel.streams = [NSArray arrayWithArray:tmpStreams];
    
    return exModel;
}

- (CLExtractorModel *)convertToExtractorModelWithIqiyi:(CLIqiyiModel *)model {
    CLExtractorModel *exModel = [[CLExtractorModel alloc]init];
    exModel.title = model.name;
    
    NSMutableArray *tmpStreams = [NSMutableArray array];
    for (int i = 0; i < model.vidl.count; i++) {
        CLIqiyiVidlModel *vidlModel = model.vidl[i];
        CLEStream *clStream = [[CLEStream alloc]init];
        clStream.play_url = vidlModel.m3u;
        clStream.definition = vidlModel.screenSize;
        [tmpStreams addObject:clStream];
    }
    exModel.streams = [NSArray arrayWithArray:tmpStreams];
    
    return exModel;
}

- (CLExtractorModel *)convertToExtractorModelWithTx:(CLTxModel *)model {
    CLExtractorModel *exModel = [[CLExtractorModel alloc]init];
    exModel.title = ((CLTxVlVi*)model.vl.vi[0]).ti;
    
    NSArray<CLTxVlViUlUi *> *uis = ((CLTxVlVi*)model.vl.vi[0]).ul.ui;
    NSMutableArray *tmpStreams = [NSMutableArray array];
    for (int i = 0; i < uis.count; i++) {
        CLTxVlViUlUi *ui = uis[i];
        CLEStream *clStream = [[CLEStream alloc]init];
        clStream.play_url = [NSString stringWithFormat:@"%@%@", ui.url,ui.hls.pt];
        if (model.fl.cnt.integerValue > i) {
            clStream.definition = ((CLTxFlFi*)model.fl.fi[i]).cname;
        }
        [tmpStreams addObject:clStream];
    }
    exModel.streams = [NSArray arrayWithArray:tmpStreams];
    
    return exModel;
}

#pragma mark - NETWORK
- (void)feedbackWithInfo:(NSDictionary *)datas {
    NSString *strUrl = @"https://beta-tvpi.coocaa.com/wvideo/client/spider/analyze/feedback?appkey=1195de10969228413cc461ade4cfa525";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:strUrl parameters:datas progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        
//        NSDictionary *dicResponse  = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (!dicResponse) {
            NSLog(@"Extractor error feedback failed! | %@", responseObject);
        }
        NSNumber *code = dicResponse[@"code"];
        if (code && code.integerValue == 0) {
            NSLog(@"Extractor error feedback successed! ");
        } else {
            NSLog(@"Extractor error feedback failed! | %@", dicResponse);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Extractor error feedback failed! | %@", error);
    }];
}

@end
