//
//  GCNewsSubView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsSubView.h"
#import "GCNewsModel.h"
#import "GCNewsSubModel.h"
#import "GCNewsSubViewCell.h"

#import "GCNewsContentViewController.h"

#import "GamersConflictDelegate.h"
#import "GCRootViewController.h"

#import "MJRefresh.h"

#define kNewsSubModel @"GCNewsSubModel"
#define kNewsSubViewCell @"GCNewsSubViewCell"

static NSString * const reUesId = @"subViewCell";

@interface GCNewsSubView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *articlesList;

@end

@implementation GCNewsSubView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    self.dataSource = self;
    self.delegate = self;
    self.rowHeight = 300;
    self.showsVerticalScrollIndicator = NO;
    [self registerNib:[UINib nibWithNibName:kNewsSubViewCell bundle:nil] forCellReuseIdentifier:reUesId];
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refresh];
    }];
    self.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
//    self.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor clearColor];
}

- (NSMutableArray *)articlesList {
    if (_articlesList == nil) {
        _articlesList = [NSMutableArray array];
    }
    return _articlesList;
}

- (void)refresh {
    [self.refreshDelegate refreshModel];
}

- (void)loadMoreData {
    [self.refreshDelegate loadMoreModel];
}

- (void)setDataWithModel:(GCNewsModel *)model {
    if (model.newsArray.count != 0) {
        [self.articlesList removeAllObjects];
        for (NSDictionary *dic in model.newsArray) {
            NSArray *list = dic[@"data"][@"list"];
            if (list.count != 0) {
                for (NSDictionary *dic in list) {
                    GCNewsSubModel *model = [[GCNewsSubModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.articlesList addObject:model];
                }
            }
        }
        NSLog(@"%@", self.articlesList);
        model.start = self.articlesList.count;
        if ([self.mj_header isRefreshing]) {
            [self.mj_header endRefreshing];
        } else if ([self.mj_footer isRefreshing]) {
            [self.mj_footer endRefreshing];
        }
        [self reloadData];
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articlesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GCNewsSubViewCell *cell = [self dequeueReusableCellWithIdentifier:reUesId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:kNewsSubViewCell owner:nil options:nil] firstObject];
    }
    if (self.articlesList.count > 0) {
        GCNewsSubModel *model = self.articlesList[indexPath.row];
        [cell setCellWithModel:model];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GCNewsSubModel *model = self.articlesList[indexPath.row];
    GCNewsContentViewController *newsContentVC = [[GCNewsContentViewController alloc] init];
    newsContentVC.model = model;
    UINavigationController *rootViewController = (UINavigationController *)((GamersConflictDelegate *)[UIApplication sharedApplication].delegate).rootViewController;
    [rootViewController pushViewController:newsContentVC animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    rotation.m34 = 1.0/ -600;
//    
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
    
//    GCNewsSubViewCell *newsCell = (GCNewsSubViewCell *)cell;
//    
//    newsCell.titleLabel.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//    
//    [UIView animateWithDuration:1 animations:^{
//        newsCell.titleLabel.layer.transform = CATransform3DIdentity;
//    }];
}

@end
