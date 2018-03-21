//
//  CLCommon.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLCommon : NSObject

+ (NSString *)regularExpressionForSearchText:(NSString *)searchText pattern:(NSString *)pattern;

+ (NSInteger)cl_weekday:(NSDate *)date;

+ (NSString *)cl_decimalismToHex:(NSInteger)tmpid;

@end
