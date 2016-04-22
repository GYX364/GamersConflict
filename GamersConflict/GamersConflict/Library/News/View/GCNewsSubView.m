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
#import "GCNewsShowItem.h"

#import "GCNewsContentViewController.h"

#import "GamersConflictDelegate.h"
#import "GCRootViewController.h"

#import "GCBaseCellFactory.h"
#import "GCNewsAllCell.h"

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
    self.rowHeight = 190;
    self.separatorColor = [UIColor blackColor];
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.separatorInset = UIEdgeInsetsMake(0, 5, 0, 13);
    self.showsVerticalScrollIndicator = NO;
    [GCBaseCellFactory registerCellFortableView:self];
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refresh];
        [self bgvBeginAnimation];
    }];
    self.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
        [self bgvBeginAnimation];
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
    [self bgvBeginAnimation];
}

- (void)loadMoreData {
    [self.refreshDelegate loadMoreModel];
    [self bgvBeginAnimation];
}

- (void)bgvBeginAnimation {
    UIImageView *bgv = [self.superview.superview.subviews firstObject];
    if ([bgv isAnimating] == NO) {
        [bgv startAnimating];
    }
}

- (void)bgvEndAnimation {
    UIImageView *bgv = [self.superview.superview.subviews firstObject];
    if ([bgv isAnimating] == YES) {
        [bgv stopAnimating];
    }
}

- (void)setDataWithModel:(GCNewsModel *)model {
    if (model.newsArray.count != 0) {
        [self.articlesList removeAllObjects];
        
        for (NSDictionary *dic in model.newsArray) {
            NSArray *list = dic[@"data"][@"list"];
            NSLog(@"%@", list);
            if (list.count != 0) {
                for (NSDictionary *dic in list) {
                    GCNewsSubModel *model = [[GCNewsSubModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.articlesList addObject:model];
                    
                    if ([model.showtype isEqualToString:@"1"]) {
                        NSArray *showItems = model.showitem;
                        NSMutableArray *items = [NSMutableArray array];
                        for (NSMutableDictionary *dic in showItems) {
                            GCNewsShowItem *item = [[GCNewsShowItem alloc] init];
                            [item setValuesForKeysWithDictionary:dic];
                            [items addObject:item];
                        }
                        [model.showItems addObjectsFromArray:items];
                    }
                }
            }
        }
        
        model.start = self.articlesList.count;
        
        if ([self.mj_header isRefreshing]) {
            [self.mj_header endRefreshing];
        } else if ([self.mj_footer isRefreshing]) {
            [self.mj_footer endRefreshing];
        }
        
        [self bgvEndAnimation];
        [self reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articlesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GCNewsSubModel *model = self.articlesList[indexPath.row];
    
    GCBaseTableViewCell *cell = [GCBaseCellFactory cellProducedWithModel:model forTableView:tableView cellIndexPath:indexPath configred:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GCBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setCellWhenSelect];
    
    GCNewsSubModel *model = self.articlesList[indexPath.row];
    GCNewsContentViewController *newsContentVC = [[GCNewsContentViewController alloc] init];
    newsContentVC.model = model;
    UINavigationController *rootViewController = (UINavigationController *)((GamersConflictDelegate *)[UIApplication sharedApplication].delegate).rootViewController;
    [rootViewController pushViewController:newsContentVC animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
