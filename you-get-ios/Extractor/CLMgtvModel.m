//
//  CLMgtvModel.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/26.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLMgtvModel.h"

@implementation CLMgtvInfoModel
@end

@implementation CLMgtvFrameModel
@end

@implementation CLMgtvPointsModel
@end

@implementation CLMgtvShareModel
@end

@implementation CLMgtvStreamModel
@end

@implementation CLMgtvStreamQualityModel
@end

@implementation CLMgtvUserModel
@end

@implementation CLMgtvDataModel
@end

@implementation CLMgtvModel
@end

@implementation CLMgtvRealModel
@end


/*************/

@implementation StreamType

- (instancetype)initWithId:(NSString *)type_id container:(NSString *)container videoProfile:(NSString *)video_profile {
    if (self = [super init]) {
        _type_id = type_id;
        _container = container;
        _video_profile = video_profile;
    }
    return self;
}

@end

@implementation MyResult
@end

@implementation MgPiece
@end
