//
//  GCRootViewController.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseViewController.h"
@class GCMenuViewController;
@interface GCRootViewController : GCBaseViewController
// 上层根视图控制器
@property (nonatomic, strong) UIViewController *rootController;
// 菜单视图控制器
@property (nonatomic, strong) GCMenuViewController *menuController;
// 点击手势,用于显示根视图
@property (nonatomic, strong)UITapGestureRecognizer *tap;


- (id)initWithRootViewController:(UIViewController *)rootViewController;

// 显示菜单视图
- (void)showMenuView;

// 显示根视图 (点击触发)
- (void)showRootView;

// 切换根视图 (在Menu视图上点击不同VC来切换)
- (void)changeRootView:(UIViewController*)viewController;

@end
