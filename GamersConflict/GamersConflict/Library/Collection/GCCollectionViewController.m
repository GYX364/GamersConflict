//
//  GCCollectionViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCCollectionViewController.h"
#import "GCDatabaseManager.h"
#import "GCUserInfoManager.h"
#import "GCNewsSubModel.h"
#import "GCNewsAllCell.h"
#import "GCNewsPicCell.h"
#import "GCBaseCellFactory.h"
#import "GCBaseTableViewCell.h"
#import "GCNewsContentViewController.h"
#import "GamersConflictDelegate.h"
// cell View  预留
//#import "CellView.h"
@interface GCCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *collectionTableView;

// 数据库对象
@property (nonatomic, strong)GCDatabaseManager *manager;
@end

@implementation GCCollectionViewController
- (NSMutableArray *)collectionArray{
    if (_collectionArray == nil) {
        _collectionArray = [NSMutableArray array];
    }
    return _collectionArray;
}

// 视图将要出现时加载数据
- (void)viewWillAppear:(BOOL)animated{
    // 查询数据库
    self.manager = [GCDatabaseManager defaultManager];
    NSArray *arr = [self.manager selectCellModelWithUserId:[GCUserInfoManager getUserid]];
    self.collectionArray = [arr mutableCopy];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [GCBaseCellFactory registerCellFortableView:self.collectionTableView];
    [self.collectionTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    // Do any additional setup after loading the view from its nib.
}



#pragma mark -- TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.collectionArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    GCNewsSubModel *model = self.collectionArray[indexPath.row];
// 预留 通过model给cell赋值 显示在 collectionTableView上
//    GCBaseTableViewCell *cell = [GCBaseCellFactory cellProducedWithModel:model forTableView:tableView cellIndexPath:indexPath configred:YES];
    cell.textLabel.text = model.title;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // cell 详情页面
    GCNewsSubModel *model = self.collectionArray[indexPath.row];
    GCNewsContentViewController *newsContentVC = [[GCNewsContentViewController alloc] init];
    newsContentVC.model = model;
    UINavigationController *rootViewController = (UINavigationController *)((GamersConflictDelegate *)[UIApplication sharedApplication].delegate).rootViewController;
    [rootViewController pushViewController:newsContentVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
