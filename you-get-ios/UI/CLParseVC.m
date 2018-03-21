//
//  CLParseVC.m
//  you-get-ios
//
//  Created by Charlie.Z on 2017/10/24.
//  Copyright © 2017年 Charlie.Z. All rights reserved.
//

#import "CLParseVC.h"
#import "CLParseItemCell.h"
#import <you_get_sdk/you_get_sdk.h>
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
//    [[CLExtractorManager sharedInstance] downloadByVid:@"6518741629925327368" src:self.src];
    
    //测试爱奇艺正片
//    [[CLExtractorManager sharedInstance] downloadByTvid:@"898016000" vid:@"9d3c0a39d140eb7479ea774198539c60" src:self.src];
//    [[CLExtractorManager sharedInstance] downloadByTvid:@"561328100" vid:@"fdcd77b5e07c26c6e7ae69ca5b826657" src:self.src];
    
}

- (void)cl_extractorResultWithObject:(id)obj src:(NSString *)src {
    if (!obj) {
        return;
    }
    self.exModel = obj;
    
    self.navigationItem.title = self.exModel.title;
    
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
