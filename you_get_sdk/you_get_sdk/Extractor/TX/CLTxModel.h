//
//  CLTxModel.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/12/19.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CLTxFlFi;
@protocol CLTxVlVi;
@protocol CLTxVlViUlUi;

/**FL*/
@interface CLTxFlFi : JSONModel

@property(copy, nonatomic) NSString *cname;

@end

@interface CLTxFl : JSONModel

@property(strong, nonatomic) NSArray<CLTxFlFi> *fi;

@property(strong, nonatomic) NSNumber *cnt;

@end

/**VL*/
@interface CLTxVlViUlUiHls : JSONModel

@property(copy, nonatomic) NSString *pt;

@end

@interface CLTxVlViUlUi : JSONModel

@property(copy, nonatomic) NSString *url;

@property(strong, nonatomic) CLTxVlViUlUiHls *hls;

@end

@interface CLTxVlViUl : JSONModel

@property(strong, nonatomic) NSArray<CLTxVlViUlUi> *ui;

@end

@interface CLTxVlVi : JSONModel

@property(strong, nonatomic) CLTxVlViUl *ul;

@property(copy, nonatomic) NSString *ti;

@end

@interface CLTxVl : JSONModel

@property(strong, nonatomic) NSArray<CLTxVlVi> *vi;

@property(strong, nonatomic) NSNumber *cnt;

@end

/**腾讯MODEL*/
@interface CLTxModel : JSONModel

@property(strong, nonatomic) CLTxFl *fl;

@property(strong, nonatomic) CLTxVl *vl;

@end



//////////////中间量//////////////////////////////////////////
@interface CLTxVinfoParam : JSONModel

@property(copy,nonatomic) NSString *appVer;
@property(copy,nonatomic) NSString *cKey;
@property(strong,nonatomic) NSNumber *charge;
@property(copy,nonatomic) NSString *defaultfmt;
@property(copy,nonatomic) NSString *defn;
@property(strong,nonatomic) NSNumber *defnpayver;
@property(strong,nonatomic) NSNumber *defsrc;
@property(strong,nonatomic) NSNumber *dtype;
@property(copy,nonatomic) NSString *ehost;
@property(copy,nonatomic) NSString *encryptVer;
@property(strong,nonatomic) NSNumber *fhdswitch;
@property(copy,nonatomic) NSString *flowid;
@property(copy,nonatomic) NSString *guid;
@property(copy,nonatomic) NSString *host;
@property(strong,nonatomic) NSNumber *isHLS;
@property(copy,nonatomic) NSString *otype;
@property(copy,nonatomic) NSString *platform;
@property(copy,nonatomic) NSString *refer;
@property(copy,nonatomic) NSString *sdtfrom;
@property(strong,nonatomic) NSNumber *show1080p;
@property(strong,nonatomic) NSNumber *sphls;
@property(strong,nonatomic) NSNumber *sphttps;
@property(strong,nonatomic) NSNumber *spwm;
@property(copy,nonatomic) NSString *tm;
@property(copy,nonatomic) NSString *unid;
@property(copy,nonatomic) NSString *vid;
@property(strong,nonatomic) NSNumber *fp2p;

- (instancetype)initWithVid:(NSString *)vid ehost:(NSString *)ehost;

@end

@interface CLTxVinfoParamReq : JSONModel
@property(copy, nonatomic) NSString *buid;
@property(copy, nonatomic) NSString *vinfoparam;
@end
