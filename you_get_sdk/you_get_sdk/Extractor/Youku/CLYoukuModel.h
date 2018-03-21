//
//  CLYoukuModel.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CLYoukuStreamModel;
@protocol CLYoukuShowModel;

@interface CLYoukuStreamModel : JSONModel

@property(copy, nonatomic) NSString *audio_lang;

@property(strong, nonatomic) NSNumber *milliseconds_video;

@property(strong, nonatomic) NSNumber *milliseconds_audio;

@property(copy, nonatomic) NSArray *segs;

@property(copy, nonatomic) NSDictionary *stream_ext;

@property(strong, nonatomic) NSNumber *size;

@property(copy, nonatomic) NSString *subtitle_lang;

@property(copy, nonatomic) NSString *media_type;

@property(copy, nonatomic) NSString *drm_type;

@property(copy, nonatomic) NSString *stream_type;

@property(strong, nonatomic) NSNumber *width;

@property(strong, nonatomic) NSNumber *height;

@property(copy, nonatomic) NSString *logo;

@property(copy, nonatomic) NSString *m3u8_url;

@end

@interface CLYoukuShowModel : JSONModel

@property(copy, nonatomic) NSString *title;

@end

@interface CLYoukuModel : JSONModel

@property(strong, nonatomic) NSDictionary<Optional> *preview;

@property(strong, nonatomic) NSDictionary<Optional> *controller;

@property(strong, nonatomic) NSDictionary<Optional> *videos;

@property(strong, nonatomic) NSDictionary<Optional> *video;

@property(strong, nonatomic) NSDictionary<Optional> *dvd;

@property(strong, nonatomic) CLYoukuShowModel *show;

@property(strong, nonatomic) NSArray<CLYoukuStreamModel> *stream;

@end
