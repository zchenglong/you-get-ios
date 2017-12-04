//
//  CLYouKuExtractor.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/23.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CLVideoExtractor.h"
#import "CLExtractor.h"


@interface CLYouKuExtractor : CLExtractor

+ (instancetype)sharedInstance;

@property(copy, nonatomic) NSString *url;
@property(copy, nonatomic) NSString *title;
@property(copy, nonatomic) NSString *vid;
@property(copy, nonatomic) NSString *m3u8_url;
@property(copy, nonatomic) NSString *streams;
@property(copy, nonatomic) NSString *streams_sorted;
@property(copy, nonatomic) NSString *audiolang;
@property(assign, nonatomic) BOOL password_protected;
@property(copy, nonatomic) NSString *dash_streams;
@property(copy, nonatomic) NSString *caption_tracks;
//@property(copy, nonatomic) NSString *out;
@property(copy, nonatomic) NSString *ua;
@property(copy, nonatomic) NSString *referer;
@property(copy, nonatomic) NSString *danmuku;

- (void)downloadByVid:(NSString *)vid src:(NSString *)src;

@end
