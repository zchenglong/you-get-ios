//
//  NSData+CRC32.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/31.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "NSData+CRC32.h"
#import <zlib.h>

@implementation NSData (CRC32)

- (uint32_t)crc32 {
    uLong crc = crc32(0L, Z_NULL, 0);
    crc = crc32(crc, self.bytes, (uInt)self.length);
    return (uint32_t)crc;
}

@end
