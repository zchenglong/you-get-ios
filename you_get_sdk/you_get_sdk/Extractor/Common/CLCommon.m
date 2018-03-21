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

+ (NSInteger)cl_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

//10进制转16进制(0-15)
+ (NSString *)cl_decimalismToHex:(NSInteger)tmpid {
    
    NSString *nLetterValue;
    NSString *str =@"";
    
    NSInteger ttmpig;
    
    while (YES) {
        ttmpig = tmpid % 16;
        tmpid = tmpid/16;
        
        switch (ttmpig) {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
                
            default:
                nLetterValue = [[NSString alloc]initWithFormat:@"%d",(int)ttmpig];
        }
        
        str = [nLetterValue stringByAppendingString:str];
        
        if (tmpid == 0) {
            break;
        }
    }
    
    return str;
    
}

@end
