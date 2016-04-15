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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuListArray = [[NSMutableArray alloc]initWithObjects:@"第一个",@"第二个", nil];
    [self.menuListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginAction:(id)sender {
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
    GCRootViewController *rootVC  = ((GamersConflictDelegate*)[UIApplication sharedApplication].delegate).rootViewController;
    if (indexPath.row == 0) {
        TestViewController *tVC = [[TestViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tVC];
        [rootVC changeRootView:nav];
        
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end