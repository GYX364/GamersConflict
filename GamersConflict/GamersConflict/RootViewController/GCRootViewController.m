//
//  GCRootViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//
#import "GCRootViewController.h"
#import "GCNewsViewController.h"
#import "GCMenuViewController.h"
#import "GCUserInfoManager.h"
#define kSCREENWIDTH self.view.bounds.width


@interface GCRootViewController ()<UIGestureRecognizerDelegate>{
    BOOL isShowingMenu;// 是否正在显示菜单
    BOOL isChange;// 是否变化RootVC
}

// 触发抽屉按钮Button
@property (nonatomic, strong)UIButton *drawerButton;


@end

@implementation GCRootViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super init];
    if (self) {
        _rootController = rootViewController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRootController:_rootController];
    [self.navigationController.navigationBar setHidden:YES];
    isShowingMenu = NO;
    isChange = NO;
    GCMenuViewController *menuVC = [[GCMenuViewController alloc]init];
    self.menuController = menuVC;
    // tap
    self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backAction:)];
    self.tap.delegate = self;
    [self.view addGestureRecognizer:self.tap];
}

#pragma mark -- set方法
- (void)setRootController:(UIViewController *)rootController {
    if (!rootController) {
        return;
    }
    // 抽屉按钮
    self.drawerButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.drawerButton.frame =CGRectMake(10, ScreenHeight - 50, 50, 50);
    self.drawerButton.layer.cornerRadius = 25;
    // 图片
    //    self.drawerButton.currentBackgroundImage
//    [self.drawerButton setTitle:@"抽屉" forState:(UIControlStateNormal)];
    [self.drawerButton setBackgroundImage:[UIImage imageNamed:@"extend3.tif"] forState:(UIControlStateNormal)];
    self.drawerButton.backgroundColor = [UIColor blackColor];
    
    UIViewController *formarController = _rootController;
    _rootController = rootController;
    
    if (rootController) {
        if (formarController) {
            [formarController.view removeFromSuperview];
            formarController = nil;
        }
        if ([rootController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNC = (UINavigationController *)rootController;
            [rootNC setNavigationBarHidden:YES];
        }
        //
        UIView *view = _rootController.view;
        if (isChange) {
            view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 3 / 4, 0, ScreenWidth, ScreenHeight);
        }else{
            view.frame = self.view.bounds;
        }
        [view addSubview:self.drawerButton];
        [self.drawerButton addTarget:self action:@selector(drawerAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:view];
    }
}
/**
 *  初始化菜单VC,取出VIew,加入最底层
 *
 */
- (void)setMenuController:(GCMenuViewController *)menuController{
    if (!menuController) {
        return;
    }
    _menuController = menuController;
    UIView *menuView = _menuController.view;
//    menuView.frame = CGRectMake(0, 0, ScreenWidth * 3 / 4, ScreenHeight);
    menuView.frame = self.view.bounds;
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    UIImageView *menuIV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [menuIV setImage:[UIImage imageNamed:@"111.png"]];
    // 放到底层
    [self.view insertSubview:menuIV atIndex:0];
    [self.view insertSubview:menuView atIndex:1];
    // 判断是否已经登录
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        [_menuController.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
    }else{
        [_menuController.loginButton setTitle:@"退出登录" forState:(UIControlStateNormal)];
//        [GCUserInfoManager cancelUserid];
    }
    
}


// 触发抽屉效果
- (void)drawerAction:(UIButton*)sender{
    
    [self showMenuView];
//    [self showMenu];
}

// 点击手势,收回抽屉
- (void)backAction:(UITapGestureRecognizer*)tap{
    [self.tap setEnabled:NO];
    [self showRootView];
}

// 手势代理方法
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer == _tap) {
        if (self.rootController && isShowingMenu) {
            // 判断点击的点是否在一个RECT 中  第二个参数(点) 在哪个VIew上的点
            return CGRectContainsPoint(self.rootController.view.frame, [gestureRecognizer locationInView:self.view]);
        }
        return NO;
    }
    return YES;
}

#pragma mark -- 显示根视图
- (void)showRootView{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rootFrame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.rootController.view.frame = rootFrame;
    } completion:^(BOOL finished) {
        isShowingMenu = NO;
        self.rootController.view.userInteractionEnabled = YES;
    }];
}

- (void)showMenuView{
    CGRect rootFrame = CGRectMake(self.view.bounds.size.width * 3 /4, 0, ScreenWidth, ScreenHeight);
    [UIView animateWithDuration:0.5 animations:^{
        self.rootController.view.frame = rootFrame;
    } completion:^(BOOL finished) {
        [self.tap setEnabled:YES];
        isShowingMenu = YES;
        self.rootController.view.userInteractionEnabled = NO;
    }];
    
}

- (void)showMenu{
    [UIView animateWithDuration:4 animations:^{
        [[self.rootController.view.subviews objectAtIndex:2].subviews[0] setFrame:CGRectMake(0, ScreenHeight / 2, ScreenWidth, 1)];
    } completion:^(BOOL finished) {
        [self.view addSubview:self.menuController.view];
    }];
}

- (void)changeRootView:(UIViewController *)viewController{
    if (!viewController) {
        return;
    }
    if (!isShowingMenu) {
        return;
    }
    isChange = YES;
    [self setRootController:viewController];
    [self showRootView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
