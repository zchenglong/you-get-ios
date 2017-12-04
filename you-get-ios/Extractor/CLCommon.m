//
//  CLCommon.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLCommon.h"

@implementation CLCommon

+ (NSString *)regularExpressionForSearchText:(NSString *)searchText pattern:(NSString *)pattern {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:NSMatchingReportProgress range:NSMakeRange(0, [searchText length])];

    if (result && result.numberOfRanges == 2) {
        return [searchText substringWithRange:[result rangeAtIndex:1]];
    } else if (result && result.numberOfRanges == 1) {
        return [searchText substringWithRange:result.range];
    }
    
    return nil;
}

@end
