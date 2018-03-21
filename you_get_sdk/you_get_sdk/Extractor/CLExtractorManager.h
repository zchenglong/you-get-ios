//
//  CLExtractorManager.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/25.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLConstants.h"

@protocol CLExtractorManagerDelegate <NSObject>

- (void)cl_extractorResultWithObject:(id)obj src:(NSString *)src;

@end

@interface CLExtractorManager : NSObject

+ (instancetype)sharedInstance;

@property(weak, nonatomic) id<CLExtractorManagerDelegate> delegate;

/**
 * 通过网页链接解析
 */
- (void)downloadByUrl:(NSString *)url src:(NSString *)src;

/**
 * 通过视频ID解析
 */
- (void)downloadByVid:(NSString *)vid src:(NSString *)src;

/**
 * 针对酷开媒资库爱奇艺源
 * src仅接受ug_iqiyi
 */
- (void)downloadByTvid:(NSString *)tvid vid:(NSString*)vid src:(NSString *)src;

@end
