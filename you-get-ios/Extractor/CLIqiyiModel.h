//
//  CLIqiyiModel.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/11/3.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CLIqiyiVidlModel;

@interface CLIqiyiVidlModel : JSONModel

@property(copy, nonatomic) NSString *m3u;
@property(copy, nonatomic) NSString *m3utx;
@property(copy, nonatomic) NSString *screenSize;
@property(copy, nonatomic) NSString *vid;

@property(strong, nonatomic) NSNumber *code;
@property(strong, nonatomic) NSNumber *dr;
@property(strong, nonatomic) NSNumber *drmType;
@property(strong, nonatomic) NSNumber *unencryptedDuration;
@property(strong, nonatomic) NSNumber *vd;

@end

@interface CLIqiyiModel : JSONModel

@property(copy, nonatomic) NSString<Optional> *name;

@property(copy, nonatomic) NSArray<CLIqiyiVidlModel> *vidl;

@end

@interface CLIqiyiInfoModel : JSONModel

@property(copy, nonatomic) NSString *name;

@end


