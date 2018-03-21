//
//  you_get_sdk.h
//  you_get_sdk
//
//  Created by Charlie.Z on 2018/1/2.
//  Copyright © 2018年 Charlie.Z. All rights reserved.
//

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

//#import <UIKit/UIKit.h>


#import "CLConstants.h"
#import "CLExtractorManager.h"
#import "CLExtractorModel.h"

//! Project version number for you_get_sdk.
FOUNDATION_EXPORT double you_get_sdkVersionNumber;

//! Project version string for you_get_sdk.
FOUNDATION_EXPORT const unsigned char you_get_sdkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <you_get_sdk/PublicHeader.h>



