//
//  CLExtractorModel.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/31.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CLEStream : JSONModel
/**清晰度*/
@property(copy, nonatomic) NSString *definition;
/**播放链接*/
@property(copy, nonatomic) NSString *play_url;
@end


@interface CLExtractorModel : JSONModel
/**视频名称*/
@property(copy, nonatomic) NSString *title;
/**视频流结构体*/
@property(copy, nonatomic) NSArray<CLEStream *> *streams;
@end
