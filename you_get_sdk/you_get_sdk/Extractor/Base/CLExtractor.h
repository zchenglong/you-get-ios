//
//  CLExtractor.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/23.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CLExtractorDelegate <NSObject>

- (void)cl_extractorResultWithErrorCode:(NSString *)errorCode requestUrl:(NSString *)requestUrl src:(NSString *)src;

- (void)cl_extractorResultWithObject:(id)obj src:(NSString *)src;

@end

@interface CLExtractor : NSObject

@property(weak, nonatomic) id<CLExtractorDelegate> delegate;

- (void)downloadByUrl:(NSString *)url;

- (void)downloadByVid:(NSString *)vid;

- (void)downloadByTvid:(NSString *)tvid vid:(NSString *)vid;

- (void)callbackErrorWithSrc:(NSString *)src;

- (void)callbackErrorWithSrc:(NSString *)src errCode:(NSInteger)errCode requestUrl:(NSString *)requestUrl;

@end
