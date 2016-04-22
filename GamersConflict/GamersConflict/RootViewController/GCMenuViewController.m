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
#import "GCCollectionViewController.h"

#import "GCLoginViewController.h"

#import "GCClearCache.h"
#import <UMSocial.h>



#define kColor arc4random()%256 / 255.0

#define kCos60 0.5
#define kSin60 0.866

#define kPointX CGRectGetMidX(self.moreButton.frame)
#define kPointY CGRectGetMidY(self.moreButton.frame)
#define kRadius 30.0

#define kWidth 50

#define kOffsetLeftX (-(4 * kRadius * kCos60 ))
#define kOffsetRightX (4 * kRadius * kCos60 )
#define kOffsetX (4 * kRadius * kCos60)
#define kOffsetZero 0
#define kOffsetUpY (- (4 * kRadius * kSin60))
#define kOffsetDownY (4 * kRadius * kSin60)
#define kOffsetY (4 * kRadius * kSin60)

@interface GCMenuViewController ()<UMSocialUIDelegate>{
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
    // 登陆后
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        //        [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
        self.button2.backgroundColor = [UIColor lightGrayColor];
    }else{
        //        [self.loginButton setTitle:@"退出登录" forState:(UIControlStateNormal)];
        self.button2.backgroundColor = [UIColor clearColor];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.menuView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.menuView];
    [self layoutButton];
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        //        [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
        self.button2.backgroundColor = [UIColor lightGrayColor];
    }else{
        //        [self.loginButton setTitle:@"退出登录" forState:(UIControlStateNormal)];
        self.button2.backgroundColor = [UIColor clearColor];
    }
    self.menuListArray = [[NSMutableArray alloc]initWithObjects:@"第一个",@"第二个", nil];
    [self.menuListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    isOpen = NO;
    self.rootVC  = (GCRootViewController*)((GamersConflictDelegate*)[UIApplication sharedApplication].delegate).rootViewController;
    
    //
    
    // Do any additional setup after loading the view from its nib.
}



- (void)layoutButton{
    self.moreButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth / 2.0 - 50 - 50, ScreenHeight / 2.0 - 50, 2 * kRadius, 2 * kRadius)];
//    self.moreButton.layer.masksToBounds = YES;
    self.moreButton.layer.cornerRadius = kRadius;
    [self.moreButton setBackgroundImage:[UIImage imageNamed:@"extend4.tif"] forState:(UIControlStateNormal)];
    [self.moreButton addTarget:self action:@selector(bAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.button1 = [self createButton];
      [self.button1 setBackgroundImage:[UIImage imageNamed:@"home1.tif"] forState:(UIControlStateNormal)];
    [self.button1 addTarget:self action:@selector(backRoot:) forControlEvents:(UIControlEventTouchUpInside)];
   

    
    self.button2 = [self createButton];
    [self.button2 setBackgroundImage:[UIImage imageNamed:@"user1.tif"] forState:(UIControlStateNormal)];

    [self.button2 addTarget:self action:@selector(loginAction:) forControlEvents:(UIControlEventTouchUpInside)];

    
    self.button3 = [self createButton];
    [self.button3 setBackgroundImage:[UIImage imageNamed:@"favorite1.tif"] forState:(UIControlStateNormal)];
    [self.button3 addTarget:self action:@selector(collection:) forControlEvents:(UIControlEventTouchUpInside)];

    self.button4 = [self createButton];
    [self.button4 setBackgroundImage:[UIImage imageNamed:@"message1.tif"] forState:(UIControlStateNormal)];
    [self.button4 addTarget:self action:@selector(aboutUs:) forControlEvents:(UIControlEventTouchUpInside)];

    self.button5 = [self createButton];
    [self.button5 setBackgroundImage:[UIImage imageNamed:@"share1.tif"] forState:(UIControlStateNormal)];
    [self.button5 addTarget:self action:@selector(share:) forControlEvents:(UIControlEventTouchUpInside)];

    self.button6 = [self createButton];
    [self.button6 setBackgroundImage:[UIImage imageNamed:@"delete2.tif"] forState:(UIControlStateNormal)];
    [self.button6 addTarget:self action:@selector(cleanCaches:) forControlEvents:(UIControlEventTouchUpInside)];
    
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

        [self showButton:self.button1 tx:(-kOffsetX) ty:(-kOffsetY)];
        [self showButton:self.button2 tx:kOffsetZero ty:(- (kOffsetY))];
        [self showButton:self.button3 tx:kOffsetX ty:-kOffsetY];
        [self showButton:self.button4 tx:kOffsetX ty:kOffsetY];
        [self showButton:self.button5 tx:kOffsetZero ty:kOffsetY];
        [self showButton:self.button6 tx:-kOffsetX ty:kOffsetY];
    } completion:^(BOOL finished) {
        isOpen = YES;
        [self.moreButton setEnabled:YES];
        
    }];
}

- (void)close{
    [UIView animateWithDuration:0.3 animations:^{
        [self showButton:self.button1 tx:kOffsetX ty:kOffsetY];
        [self showButton:self.button2 tx:kOffsetZero ty:kOffsetY];
        [self showButton:self.button3 tx:-kOffsetX ty:kOffsetY];
        [self showButton:self.button4 tx:-kOffsetX ty:-kOffsetY];
        [self showButton:self.button5 tx:kOffsetZero ty:-kOffsetY];
        [self showButton:self.button6 tx:kOffsetX ty:-kOffsetY];
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

- (void)loginAction:(UIButton *)sender{
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        // 跳转登陆页面
        GCLoginViewController *loginVC = [[GCLoginViewController alloc]init];
        [self.rootVC presentViewController:loginVC animated:YES completion:nil];
    }else{
        // 退出登录
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"退出登录" message:@"您确定要退出登录吗" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            // 确定退出, 删除Userid
            [GCUserInfoManager cancelUserid];

            self.button2.backgroundColor = [UIColor lightGrayColor];
            if (isOpen) {
                [self backRoot:sender];
            }
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [alertVC addAction:action1];
        [alertVC addAction:action2];
        [self showViewController:alertVC sender:nil];
        // 如果此时RootVC中的V是collectionView ,则跳转回主页
        

    }

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

- (void)cleanCaches:(UIButton *)sender{
    float size = [GCClearCache folderSizeOfPath:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]];
    NSString *message = [NSString stringWithFormat:@"缓存大小为%.2fM,确定要清理缓存吗?",size];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [GCClearCache cleanCacheWithPath:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC addAction:confirm];
    [alertVC addAction:cancle];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}

// 分享
- (void)share:(UIButton *)sender{
    if (![[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"570dbc26e0f55a08be00055f"
                                          shareText:@"你要分享的文字"
                                         shareImage:[UIImage imageNamed:@"icon.png"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatTimeline,UMShareToWechatSession,UMShareToSina,UMShareToQQ,nil]
                                           delegate:self];
    }else{
        GCLoginViewController *loginVC = [[GCLoginViewController alloc]init];
        [self.rootVC  presentViewController:loginVC animated:YES completion:^{
            
        }];
    }
}

// 关于我们
- (void)aboutUs:(UIButton*)sender{
    TestViewController *testVC = [[TestViewController alloc]init];
//    UINavigationController *aboutUs = [[UINavigationController alloc]initWithRootViewController:testVC];
//    [(GCRootViewController*)([((UINavigationController *)self.rootVC).viewControllers firstObject]) changeRootView:aboutUs];
//    [self showViewController:testVC sender:self];
}

// 创建小Button
- (UIButton *)createButton{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame) , CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    button.layer.cornerRadius = kWidth / 2.0;

    button.alpha = 0.0;
    [self.menuView addSubview:button];
    return button;
}

- (void)showButton:(UIButton*)button tx:(CGFloat)tx ty:(CGFloat)ty{
    button.transform = CGAffineTransformTranslate(button.transform, tx, ty);
    if (isOpen) {
        button.alpha = 0.0;
    }else{
    button.alpha = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
