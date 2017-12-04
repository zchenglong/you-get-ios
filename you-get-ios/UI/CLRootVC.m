//
//  CLRootVC.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLRootVC.h"
#import "CLRootItemCell.h"
#import "CLRootItemModel.h"
#import "CLWebVC.h"
#import "CLExtractorManager.h"

@interface CLRootVC ()

@property(copy, nonatomic) NSMutableArray<CLRootItemModel *> *datas;

@end

@implementation CLRootVC

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
        [_datas addObject:[CLRootItemModel instanceWithCellId:SRC_YOUKU cellName:@"优酷" url:@"http://www.youku.com"]];
        [_datas addObject:[CLRootItemModel instanceWithCellId:SRC_TUDOU cellName:@"土豆" url:@"http://www.tudou.com"]];
        [_datas addObject:[CLRootItemModel instanceWithCellId:SRC_MGTV cellName:@"芒果TV" url:@"https://www.mgtv.com"]];
        [_datas addObject:[CLRootItemModel instanceWithCellId:SRC_IQIYI cellName:@"爱奇艺" url:@"http://www.iqiyi.com"]];
        [_datas addObject:[CLRootItemModel instanceWithCellId:SRC_XIGUA cellName:@"西瓜视频" url:@"https://www.ixigua.com"]];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CLRootItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_ROOT_ITEM];
    [cell.labelTitle setText:self.datas[indexPath.row].cellName];
    cell.tag = indexPath.row;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CLRootItemCell *cell = sender;
    NSInteger index = cell.tag;
    CLRootItemModel *model = self.datas[index];
    
    CLWebVC *webVC = segue.destinationViewController;
    webVC.url = model.url;
    webVC.src = model.cellId;
}

@end
