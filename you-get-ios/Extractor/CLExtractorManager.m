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
#import "CLExtractorModel.h"
#import "CLYoukuModel.h"
#import "CLMgtvModel.h"
#import "CLXiguaModel.h"
#import "CLIqiyiModel.h"

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
    }
}

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
        }
        [self.delegate cl_extractorResultWithObject:exModel src:src];
    }
}

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

@end
