//
//  CLTxModel.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/12/19.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLTxModel.h"
#import "NSString+CLURLEncode.h"
#import "CLCommon.h"

@implementation CLTxModel

@end

/**FL*/
@implementation CLTxFlFi : JSONModel
@end

@implementation CLTxFl : JSONModel
@end

/**VL*/
@implementation CLTxVlViUlUiHls : JSONModel
@end

@implementation CLTxVlViUlUi : JSONModel
@end

@implementation CLTxVlViUl : JSONModel
@end

@implementation CLTxVlVi : JSONModel
@end

@implementation CLTxVl : JSONModel
@end

/***/
@implementation CLTxVinfoParam

- (instancetype)initWithVid:(NSString *)vid ehost:(NSString *)ehost {
    if (self = [super init]) {
        self.appVer = @"3.5.35";
        self.platform = @"10901";
        self.charge = @0;
        self.defaultfmt = @"auto";
        self.defn = @"";
        self.defsrc = @1;
        self.dtype = @3;
        self.defnpayver = @1;
        self.fp2p = @1;
        
        if(!ehost){
            ehost = @"https://v.qq.com/";
        }
        self.ehost = [ehost cl_urlEncode];
        self.refer = [ehost cl_urlEncode];
        
        self.encryptVer = [self getEncryVer];
        self.fhdswitch = @0;
        self.flowid = [self getFlowId];
        self.guid = [self getUnid];
        self.host = @"v.qq.com";
        self.isHLS = @1;
        self.otype = @"ojson";
        self.sdtfrom = @"v1010";
        self.show1080p = @1;
        self.sphls = @1;
        self.sphttps = @1;
        self.spwm = @4;
        self.tm = [NSString stringWithFormat:@"%d",(int)[[NSDate date]timeIntervalSince1970]];
        self.unid = [self getUnid];
        self.vid = vid;
        self.cKey = [self buildCKey];

    }
    return self;
}

- (NSString *)getEncryVer {
    NSInteger week = [CLCommon cl_weekday:[NSDate date]];
    week = week - 1;
    if (week == 0) {
        week = 7;
    }
    return [NSString stringWithFormat:@"7.%d",(int)week];
}

- (NSString *)getFlowId {
    return [NSString stringWithFormat:@"%@_%@",[self getPlayId],[self getPlatform]];
}

- (NSString *)getPlayId {
    return [self createGUID];
}

- (NSString *)getPlatform {
    return @"10901";
}

- (NSString *)createGUID {
    NSString *guid = @"";
    NSInteger max = 15;
    NSInteger min = 0;
    for (NSInteger i = 0; i < 32; i++) {
        NSInteger s = (arc4random() % max) % (max-min+1) + min;
        NSString * sHex = [CLCommon cl_decimalismToHex:s];
        guid = [guid stringByAppendingString:sHex];
    }
    return [guid lowercaseString];
}

- (NSString *)getUnid {
    return [self createGUID];
}

- (NSString *)buildCKey {
    NSString *ckey = nil;
    NSString *subVer = [self.encryptVer substringFromIndex:2];
    NSInteger sver = subVer.integerValue;
    NSArray *magics = @[@"06fc1464",@"4244ce1b",@"77de31c5",@"e0149fa2",@"60394ced",@"2da639f0",@"c2f0cf9f"];
    NSString *seed = [NSString stringWithFormat:@"%@%@%@*#06#%@",magics[sver-1],self.vid,self.tm,self.platform];
  
    ckey = [seed cl_encryptMD5];
    return ckey;
}

@end


@implementation CLTxVinfoParamReq

@end
