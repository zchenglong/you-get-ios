//
//  CLParseVC.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLParseVC.h"
#import "CLParseItemCell.h"
#import "CLExtractorManager.h"
#import "CLExtractorModel.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface CLParseVC () <UITableViewDelegate, UITableViewDataSource, CLExtractorManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic) CLExtractorModel *exModel;

@property(copy, nonatomic) NSMutableArray *datas;

@property(strong, nonatomic) AVPlayerViewController *playerVC;

@end

@implementation CLParseVC

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (AVPlayerViewController *)playerVC {
    if (!_playerVC) {
        _playerVC = [[AVPlayerViewController alloc]init];
    }
    return _playerVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
}

- (void)initViews {
    
    [CLExtractorManager sharedInstance].delegate = self;
    [[CLExtractorManager sharedInstance] downloadByUrl:self.url src:self.src];
}

- (void)cl_extractorResultWithObject:(id)obj src:(NSString *)src {
    if (!obj) {
        return;
    }
    self.exModel = obj;
    
    [self.datas removeAllObjects];
    [self.datas addObjectsFromArray:self.exModel.streams];
    
    [self.tableView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CLParseItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_PARSE];

    CLEStream *stream = self.datas[indexPath.row];
    cell.labelResolution.text = stream.definition;
    cell.labelUrl.text = stream.play_url;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    CLEStream *model = self.datas[indexPath.row];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:model.play_url]];
    AVPlayer *avPlayer = [AVPlayer playerWithPlayerItem:playerItem];
    
    [self.playerVC setPlayer:avPlayer];
    [avPlayer play];
    
    [self presentViewController:self.playerVC animated:YES completion:^{
        
    }];
    
}

@end
