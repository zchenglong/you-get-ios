//
//  CLXiguaModel.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/31.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CLXiguaVideo : JSONModel
@property(strong, nonatomic) NSString *main_url;
@property(strong, nonatomic) NSString *backup_url_1;
@property(strong, nonatomic) NSString *codec_type;
@property(strong, nonatomic) NSString *definition;
@property(strong, nonatomic) NSString *logo_type;
@property(strong, nonatomic) NSString *vtype;
@property(strong, nonatomic) NSNumber *bitrate;
@property(strong, nonatomic) NSNumber *preload_interval;
@property(strong, nonatomic) NSNumber *preload_max_step;
@property(strong, nonatomic) NSNumber *preload_min_step;
@property(strong, nonatomic) NSNumber *preload_size;
@property(strong, nonatomic) NSNumber *size;
@property(strong, nonatomic) NSNumber *vheight;
@property(strong, nonatomic) NSNumber *vwidth;
@end

@interface CLXiguaModel : JSONModel

@property(strong, nonatomic) NSNumber *enable_ssl;
@property(strong, nonatomic) NSNumber *status;
@property(strong, nonatomic) NSString *poster_url;
@property(strong, nonatomic) NSString *user_id;
@property(strong, nonatomic) NSString *validate;
@property(strong, nonatomic) NSString *video_duration;
@property(strong, nonatomic) NSString *video_id;
@property(strong, nonatomic) NSDictionary *video_list;

/**自定义对象，将字典video_list转换成数组videos*/
@property(strong, nonatomic) NSArray<CLXiguaVideo *><Optional> *videos;

@end
