//
//  NSString+CLURLEncode.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CLURLEncode)

- (NSString *)cl_urlEncode;

- (NSString *)cl_urlDecode;

- (NSString *)cl_encryptMD5;

@end
