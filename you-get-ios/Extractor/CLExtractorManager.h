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

- (void)downloadByUrl:(NSString *)url src:(NSString *)src;
- (void)downloadByVid:(NSString *)vid src:(NSString *)src;

@end
