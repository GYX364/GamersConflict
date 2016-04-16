//
//  GCCollectionViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCCollectionViewController.h"
// cell View  预留
//#import "CellView.h"
@interface GCCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *collectionTableView;

@end

@implementation GCCollectionViewController
- (NSMutableArray *)collectionArray{
    if (_collectionArray == nil) {
        _collectionArray = [NSMutableArray array];
    }
    return _collectionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    GCBaseModel *model = self.collectionArray[indexPath.row];
// 预留 通过model给cell赋值 显示在 collectionTableView上
//    cell.textLabel.text = model.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // cell 详情页面
//    CellView *cellView = [[CellView alloc]init];
//    self showViewController:<#(nonnull UIViewController *)#> sender:<#(nullable id)#>
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
