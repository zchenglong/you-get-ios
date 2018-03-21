//
//  CLMgtvModel.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/26.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CLMgtvInfoModel;
@protocol CLMgtvFrameModel;
@protocol CLMgtvPointsModel;
@protocol CLMgtvShareModel;
@protocol CLMgtvStreamQualityModel;
@protocol CLMgtvStreamModel;
@protocol CLMgtvUserModel;
@protocol CLMgtvDataModel;

@class MyResult;

@interface CLMgtvInfoModel : JSONModel
@property(copy, nonatomic) NSString * buytips;
@property(strong, nonatomic) NSNumber * clipLimit;
@property(copy, nonatomic) NSString * clip_type;
@property(copy, nonatomic) NSString * collection_id;
@property(copy, nonatomic) NSString * collection_name;
@property(copy, nonatomic) NSString * desc;
@property(copy, nonatomic) NSString * duration;
@property(strong, nonatomic) NSNumber * keepPlayType;
@property(copy, nonatomic) NSString * paymark;
@property(copy, nonatomic) NSString * playlist_id;
@property(copy, nonatomic) NSString * playlist_name;
@property(copy, nonatomic) NSString * price_novip;
@property(copy, nonatomic) NSString * price_vip;
@property(copy, nonatomic) NSString * root_id;
@property(copy, nonatomic) NSString * series;
@property(copy, nonatomic) NSString * series_id;
@property(copy, nonatomic) NSString * thumb;
@property(copy, nonatomic) NSString * title;
@property(copy, nonatomic) NSString * trialtime;
@property(copy, nonatomic) NSString * url;
@property(copy, nonatomic) NSString * video_id;
@property(strong, nonatomic) NSNumber * watchTime;
@end

@interface CLMgtvFrameModel : JSONModel
@property(copy, nonatomic) NSArray *images;
@property(copy, nonatomic) NSArray *second;
@end

@interface CLMgtvPointsModel :JSONModel
@property(copy, nonatomic) NSArray *content;
@property(copy, nonatomic) NSString *start;
@property(copy, nonatomic) NSString *end;
@end

@interface CLMgtvShareModel :JSONModel
@property(copy, nonatomic) NSString *dc;
@property(copy, nonatomic) NSString *qq;
@property(copy, nonatomic) NSString *qzone;
@property(copy, nonatomic) NSString *weibo;
@property(copy, nonatomic) NSString *weixin;
@end

@interface CLMgtvStreamModel :JSONModel
@property(copy, nonatomic) NSString *def;
@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *scale;
@property(copy, nonatomic) NSString *url;
@property(copy, nonatomic) NSString *vip;
@end

@interface CLMgtvStreamQualityModel :JSONModel
@property(copy, nonatomic) NSString *default_quality;
@property(copy, nonatomic) NSString *default_quality_force;
@end

@interface CLMgtvUserModel :JSONModel
@property(copy, nonatomic) NSString *ip;
@property(copy, nonatomic) NSString *iplimit;
@property(copy, nonatomic) NSString *isvip;
@property(copy, nonatomic) NSString *login;
@property(copy, nonatomic) NSString *nickname;
@property(copy, nonatomic) NSString *purview;
@property(copy, nonatomic) NSString *uuid;
@end

/**DATA*/
@interface CLMgtvDataModel : JSONModel
@property(strong, nonatomic) CLMgtvFrameModel *frame;
@property(strong, nonatomic) CLMgtvInfoModel *info;
@property(strong, nonatomic) CLMgtvPointsModel *points;
@property(strong, nonatomic) CLMgtvShareModel *share;
@property(copy, nonatomic) NSArray<CLMgtvStreamModel, Optional> *stream;
@property(copy, nonatomic) NSArray *stream_domain;
@property(strong, nonatomic) CLMgtvStreamQualityModel *stream_quality;
@property(strong, nonatomic) CLMgtvUserModel *user;
@end

/**ORIGIN MODEL*/
@interface CLMgtvModel : JSONModel
@property(strong, nonatomic) NSNumber *code;
@property(copy, nonatomic) NSString *msg;
@property(copy, nonatomic) NSString *seqid;
@property(strong, nonatomic) CLMgtvDataModel *data;

@property(copy, nonatomic) NSArray<MyResult *><Optional> *play_urls;
@end

/**REAL MODEL*/
@interface CLMgtvRealModel : JSONModel
@property(copy, nonatomic)      NSString *ver;
@property(strong, nonatomic)    NSNumber *isothercdn;
@property(copy, nonatomic)      NSString *info;
@property(copy, nonatomic)      NSString *status;
@property(copy, nonatomic)      NSString *loc;
@property(strong, nonatomic)    NSNumber *t;
@property(copy, nonatomic)      NSString *idc;
@end


/*********************解析中间存储*****************************/
@interface StreamType : JSONModel

@property(copy, nonatomic) NSString *type_id;

@property(copy, nonatomic) NSString *container;

@property(copy, nonatomic) NSString *video_profile;

- (instancetype)initWithId:(NSString *)type_id container:(NSString *)container videoProfile:(NSString *)video_profile;

@end

@interface MyResult :JSONModel

@property(copy, nonatomic) NSString *container;

@property(copy, nonatomic) NSString *video_profile;

@property(strong, nonatomic) NSNumber *size;

@property(copy, nonatomic) NSArray *pieces;

@property(copy, nonatomic) NSString *m3u8_url;

@end

@interface MgPiece :JSONModel

@property(copy, nonatomic) NSString *fileid;

@property(copy, nonatomic) NSString *segs;

@end



