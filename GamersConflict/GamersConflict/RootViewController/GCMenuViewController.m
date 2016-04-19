//
//  GCMenuViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCMenuViewController.h"
#import "GCRootViewController.h"
#import "GamersConflictDelegate.h"
#import "TestViewController.h"
#import "GCNewsViewController.h"
#import "GCUserInfoManager.h"
#import "GCLoginViewController.h"
@interface GCMenuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *menuListTableView;

// 菜单内容数组
@property (nonnull, strong)NSMutableArray *menuListArray;
@end

@implementation GCMenuViewController

#pragma mark -- 懒加载
- (NSArray *)menuListArrayAtIndexes:(NSIndexSet *)indexes{
    if (_menuListArray == nil) {
        _menuListArray = [NSMutableArray array];
    }
    return _menuListArray;
}

- (void)viewWillAppear:(BOOL)animated{
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
    }else{
        [self.loginButton setTitle:@"退出登录" forState:(UIControlStateNormal)];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuListArray = [[NSMutableArray alloc]initWithObjects:@"第一个",@"第二个", nil];
    [self.menuListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginAction:(id)sender {
    NSLog(@"1");
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        // 跳转登陆页面
        GCRootViewController *rootVC  = ((GamersConflictDelegate*)[UIApplication sharedApplication].delegate).rootViewController;
        GCLoginViewController *loginVC = [[GCLoginViewController alloc]init];
        
        
        [rootVC presentViewController:loginVC animated:YES completion:nil];
    }else{
        // 退出登录
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"退出登录" message:@"您确定要退出登录吗" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            // 确定退出, 删除Userid
             [GCUserInfoManager cancelUserid];
            // 改变button 显示
            [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [alertVC addAction:action1];
        [alertVC addAction:action2];
        [self showViewController:alertVC sender:nil];
       
        
    }
   
//    [rootVC.navigationController pushViewController:loginVC animated:YES];
    
}
#pragma mark -- TableViewDelegate方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuListArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.menuListArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取GCRootViewController 通过GCDelegate
    UIViewController *rootVC  = ((GamersConflictDelegate*)[UIApplication sharedApplication].delegate).rootViewController;
    if (indexPath.row == 0) {
        TestViewController *tVC = [[TestViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tVC];
//        [rootVC changeRootView:nav];
        [(GCRootViewController*)([((UINavigationController *)rootVC).viewControllers firstObject]) changeRootView:nav];
        
        
    } else if (indexPath.row == 1) {
        GCNewsViewController *newsVC = [[GCNewsViewController alloc] init];
        UINavigationController *newsNC = [[UINavigationController alloc] initWithRootViewController:newsVC];
//        [rootVC changeRootView:newsNC];
        [(GCRootViewController*)([((UINavigationController *)rootVC).viewControllers firstObject]) changeRootView:newsNC];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
