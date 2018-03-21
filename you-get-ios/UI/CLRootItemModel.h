//
//  CLRootItemModel.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CLRootItemModel : JSONModel

@property(copy, nonatomic) NSString* cellId;

@property(copy, nonatomic) NSString* cellName;

@property(copy, nonatomic) NSString* url;

+ (instancetype)instanceWithCellId:(NSString *)cellId cellName:(NSString *)cellName url:(NSString *)url;

@end
