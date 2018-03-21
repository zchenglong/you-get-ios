//
//  CLExtractor.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/23.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLExtractor.h"

@implementation CLExtractor

- (void)downloadByUrl:(NSString *)url {
    
}

- (void)downloadByVid:(NSString *)vid {
    
}

- (void)downloadByTvid:(NSString *)tvid vid:(NSString *)vid {
    
}

- (void)callbackErrorWithSrc:(NSString *)src {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithObject:src:)]) {
        [self.delegate cl_extractorResultWithObject:nil src:src];
    }
}

- (void)callbackErrorWithSrc:(NSString *)src errCode:(NSInteger)errCode requestUrl:(NSString *)requestUrl {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cl_extractorResultWithErrorCode:requestUrl:src:)]) {
        [self.delegate cl_extractorResultWithErrorCode:@(errCode).stringValue requestUrl:requestUrl src:src];
    }
}


@end
