//
//  CLRootItemModel.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLRootItemModel.h"

@implementation CLRootItemModel



+ (instancetype)instanceWithCellId:(NSString *)cellId cellName:(NSString *)cellName url:(NSString *)url {
    
    CLRootItemModel *model = [[CLRootItemModel alloc]init];
    model.cellId = cellId;
    model.cellName = cellName;
    model.url = url;
    return model;
}

@end
