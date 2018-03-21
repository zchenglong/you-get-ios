//
//  CLParseItemCell.h
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/25.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_ID_PARSE @"cell_id_parse"

@interface CLParseItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelResolution;
@property (weak, nonatomic) IBOutlet UILabel *labelUrl;
@end
