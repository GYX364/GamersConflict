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
#import "KYCircleMenu.h"
#import "GCCollectionViewController.h"

#import "GCLoginViewController.h"

#define kColor arc4random()%256 / 255.0

#define kCos60 0.5
#define kSin60 0.866

#define kPointX CGRectGetMidX(self.moreButton.frame)
#define kPointY CGRectGetMidY(self.moreButton.frame)
#define kRadius 30.0

#define kWidth 50

@interface GCMenuViewController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL isOpen;
}

// RootViewController
@property (nonatomic, strong)GCRootViewController *rootVC;

@property (weak, nonatomic) IBOutlet UITableView *menuListTableView;

// 菜单内容数组
@property (nonatomic, strong)NSMutableArray *menuListArray;

// 中间 按钮View
@property (nonatomic, strong)UIView *menuView;
// 分类button
@property (nonatomic, strong)UIButton *moreButton;
@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *button3;
@property (nonatomic, strong)UIButton *button4;
@property (nonatomic, strong)UIButton *button5;
@property (nonatomic, strong)UIButton *button6;

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
    self.menuView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 320, 570)];
    [self.view addSubview:self.menuView];
    [self layoutButton];
    self.menuListArray = [[NSMutableArray alloc]initWithObjects:@"第一个",@"第二个", nil];
    [self.menuListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    isOpen = NO;
    self.rootVC  = ((GamersConflictDelegate*)[UIApplication sharedApplication].delegate).rootViewController;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginAction:(id)sender {
    
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        // 跳转登陆页面
        GCRootViewController *rootVC  = (GCRootViewController *)((GamersConflictDelegate*)[UIApplication sharedApplication].delegate).rootViewController;
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
   

    
}


- (void)layoutButton{
    self.moreButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth / 2.0 - 50 - 50, ScreenHeight / 2.0 - 50, 2 * kRadius, 2 * kRadius)];
    self.moreButton.layer.masksToBounds = YES;
    self.moreButton.layer.cornerRadius = kRadius;
    self.moreButton.backgroundColor = [UIColor lightGrayColor];
    [self.moreButton setBackgroundImage:[UIImage imageNamed:@"extend.tif"] forState:(UIControlStateNormal)];
    [self.moreButton addTarget:self action:@selector(bAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.button1 = [[UIButton alloc]init];
    [self.button1 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame) + 5, CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    
    [self.button1 setBackgroundImage:[UIImage imageNamed:@"home.tif"] forState:(UIControlStateNormal)];
//    self.button1.backgroundColor = [UIColor grayColor];
    self.button1.layer.cornerRadius = kWidth / 2.0;
//    self.button1.layer.masksToBounds = YES;
    [self.button1 addTarget:self action:@selector(backRoot:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.menuView addSubview:self.button1];
    ;
   
    self.button2 = [[UIButton alloc]init];
    [self.button2 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame) + 5, CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
//    self.button2.backgroundColor = [UIColor grayColor];
    self.button2.layer.cornerRadius = kWidth / 2;
    [self.button2 setBackgroundImage:[UIImage imageNamed:@"favorite.tif"] forState:(UIControlStateNormal)];
    [self.button2 addTarget:self action:@selector(collection:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.menuView addSubview:self.button2];
    
    
    self.button3 = [[UIButton alloc]init];
    [self.button3 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame) + 5, CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
//    self.button3.backgroundColor = [UIColor grayColor];
    self.button3.layer.cornerRadius = kWidth / 2;
    [self.menuView addSubview:self.button3];
    
    
    self.button4 = [[UIButton alloc]init];
    [self.button4 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame) + 5, CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
//    self.button4.backgroundColor = [UIColor grayColor];
    self.button4.layer.cornerRadius = kWidth / 2.0;
    [self.menuView addSubview:self.button4];
    
    
    self.button5 = [[UIButton alloc]init];
    [self.button5 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame) + 5, CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
//    self.button5.backgroundColor = [UIColor grayColor];
    self.button5.layer.masksToBounds = YES;
    [self.button5 setBackgroundImage:[UIImage imageNamed:@"share.tif"] forState:(UIControlStateNormal)];
    self.button5.layer.cornerRadius = kWidth / 2.0;
    [self.menuView addSubview:self.button5];
    
    self.button6 = [[UIButton alloc]init];
    [self.button6 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame) + 5, CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
//    self.button6.backgroundColor = [UIColor grayColor];
    self.button6.layer.cornerRadius = kWidth / 2;
    [self.menuView addSubview:self.button6];
    [self.menuView addSubview:self.moreButton];
}

- (void)bAction:(UIButton *)sender{
    [self.moreButton setEnabled:NO];
    if (isOpen) {
        [self close];
    }else{
        [self open];
    }
}

- (void)open{
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.3 initialSpringVelocity:5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{

        self.button1.transform = CGAffineTransformTranslate(self.button1.transform, -(4 * kRadius * kCos60 ), - (4 * kRadius * kSin60 ));
        self.button2.transform = CGAffineTransformTranslate(self.button2.transform, 0, - (4 * kRadius * kSin60));
        self.button3.transform = CGAffineTransformTranslate(self.button3.transform, (4 * kRadius * kCos60), -(4 * kRadius * kSin60));
        self.button4.transform = CGAffineTransformTranslate(self.button4.transform, (4 * kRadius * kCos60 ),(4 * kRadius * kSin60 ));
        self.button5.transform = CGAffineTransformTranslate(self.button5.transform, 0 , (4 * kRadius * kSin60 ));
        self.button5.layer.masksToBounds = NO;
        self.button6.transform = CGAffineTransformTranslate(self.button6.transform, -(4 * kRadius * kCos60 ),(4 * kRadius * kSin60 ));
    } completion:^(BOOL finished) {
        isOpen = YES;
        [self.moreButton setEnabled:YES];
    }];
}

- (void)close{
    [UIView animateWithDuration:0.3 animations:^{
//        [self.button1 setTransform:CGAffineTransformRotate(self.button1.transform, 2 * M_PI)];
//         [self.button2 setTransform:CGAffineTransformRotate(self.button2.transform, 2 * M_PI)];
//         [self.button3 setTransform:CGAffineTransformRotate(self.button3.transform, 2 * M_PI)];
//         [self.button4 setTransform:CGAffineTransformRotate(self.button4.transform, 2 * M_PI)];
//         [self.button5 setTransform:CGAffineTransformRotate(self.button5.transform, 2 * M_PI)];
//         [self.button6 setTransform:CGAffineTransformRotate(self.button6.transform, 2 * M_PI)];
        
        // button 回收
        self.button1.transform = CGAffineTransformTranslate(self.button1.transform, (4 * kRadius * kCos60 ),  (4 * kRadius * kSin60 ));
        self.button2.transform = CGAffineTransformTranslate(self.button2.transform, 0, (4*kRadius * kSin60));
        self.button3.transform = CGAffineTransformTranslate(self.button3.transform, - ( 4 * kRadius * kCos60), (4 * kRadius * kSin60));
        self.button4.transform = CGAffineTransformTranslate(self.button4.transform, - (4 * kRadius * kCos60), - (4 * kRadius * kSin60));
        self.button5.transform = CGAffineTransformTranslate(self.button5.transform, 0, - (4 * kRadius * kSin60));
        self.button5.layer.masksToBounds = YES;
        self.button6.transform = CGAffineTransformTranslate(self.button6.transform, (4 * kRadius * kCos60), -(4 * kRadius * kSin60));
    } completion:^(BOOL finished) {
        isOpen = NO;
        [self.moreButton setEnabled:YES];
    }];
}

#pragma mark -- 各个Button方法
- (void)backRoot:(UIButton*)sender{
//     获取GCRootViewController 通过GCDelegate
    
    GCNewsViewController *newsVC = [[GCNewsViewController alloc] init];
    UINavigationController *newsNC = [[UINavigationController alloc] initWithRootViewController:newsVC];
    
    [(GCRootViewController*)([((UINavigationController *)self.rootVC).viewControllers firstObject]) changeRootView:newsNC];
    
}

- (void)collection:(UIButton*)sender{
    // 判断是否登录
    if (![[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        GCCollectionViewController *collectionVC = [[GCCollectionViewController alloc]init];
        UINavigationController *collectionNC = [[UINavigationController alloc]initWithRootViewController:collectionVC];
        [(GCRootViewController*)([((UINavigationController *)self.rootVC).viewControllers firstObject]) changeRootView:collectionNC];
    }else{
        GCLoginViewController *loginVC = [[GCLoginViewController alloc]init];
        [self.rootVC presentViewController:loginVC animated:YES completion:^{
            
        }];
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
