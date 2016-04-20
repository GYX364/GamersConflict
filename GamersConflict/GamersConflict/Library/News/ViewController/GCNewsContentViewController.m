//
//  GCNewsContentViewController.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsContentViewController.h"
#import "GCDatabaseManager.h"
#import "GCUserInfoManager.h"
#import "GCLoginViewController.h"
#import "UMSocial.h"
@interface GCNewsContentViewController ()<UMSocialUIDelegate>{
    BOOL isShowing;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webTop;

// 更多按钮, 点出  分享 收藏
@property (nonatomic, strong)UIButton *moreButton;

// 收藏按钮
@property (nonatomic, strong)UIButton *collectionButton;

// 分享按钮
@property (nonatomic, strong)UIButton *shareButton;
@end

@implementation GCNewsContentViewController

- (void)viewWillAppear:(BOOL)animated{
    // 布局button
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.model.html5 != nil) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.html5]]];
    }
   
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    NSLog(@"%f",ScreenWidth);
    [self layoutButton];
    [self.collectionButton addTarget:self action:@selector(collectionAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.shareButton addTarget:self action:@selector(shareAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (IBAction)backToNews:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

// 布局button
- (void)layoutButton{
    
    self.moreButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 80, 15, 40, 40)];
    [self.moreButton setTitle:@"更多" forState:(UIControlStateNormal)];
    NSLog(@"%@",NSStringFromCGRect(self.webView.frame));
    NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    self.moreButton.backgroundColor = [UIColor grayColor];
    self.moreButton.layer.cornerRadius = 20.0;
    self.moreButton.layer.masksToBounds = YES;
    [self.moreButton addTarget:self action:@selector(showAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.moreButton];
    
    // 收藏按钮
    self.collectionButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 80, 15, 40, 40)];
    self.collectionButton.alpha = 0.0;
    [self.collectionButton setTitle:@"收藏" forState:(UIControlStateNormal)];
    self.collectionButton.layer.masksToBounds = NO;
    self.collectionButton.layer.cornerRadius = 20.0;
    self.collectionButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionButton];
    
    // 分享按钮
    self.shareButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 80, 15, 40, 40)];
    self.shareButton.alpha = 0.0;
    [self.shareButton setTitle:@"分享" forState:(UIControlStateNormal)];
    self.shareButton.backgroundColor = [UIColor cyanColor];
    self.shareButton.layer.masksToBounds = YES;
    self.shareButton.layer.cornerRadius = 20.0;
    [self.view addSubview:self.shareButton];
    [self.view bringSubviewToFront:self.moreButton];
    [self.view bringSubviewToFront:self.collectionButton];
    [self.view bringSubviewToFront:self.shareButton];
//    [self.view sendSubviewToBack:self.webView];
    
}

- (void)showAction:(UIButton *)sender{
    [self.moreButton setEnabled:NO];
    if (!isShowing) {
        [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:3 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
            self.collectionButton.transform = CGAffineTransformMakeTranslation(-120, 0);
            self.shareButton.transform = CGAffineTransformMakeTranslation(-70, 0);
            CGAffineTransform transform;
            transform = CGAffineTransformRotate(self.moreButton.transform, 1 * M_PI);
            [self.moreButton setTransform:transform];
            self.collectionButton.alpha = 1.0;
            self.shareButton.alpha = 1.0;
        } completion:^(BOOL finished) {
            isShowing = YES;
            [self.moreButton setEnabled:YES];
        }];
    }else{
        [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:1 initialSpringVelocity:5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
            self.collectionButton.transform = CGAffineTransformMakeTranslation(120, 0);
            self.shareButton.transform = CGAffineTransformMakeTranslation(70, 0);
            CGAffineTransform transform;
            transform = CGAffineTransformRotate(self.moreButton.transform, 1 * M_PI);
            [self.moreButton setTransform:transform];
            self.collectionButton.alpha = 0.0;
            self.shareButton.alpha = 0.0;
        } completion:^(BOOL finished) {
            isShowing = NO;
            [self.moreButton setEnabled:YES];
        }];
    }

}


#pragma mark -- 收藏,分享按钮
- (void)collectionAction:(UIButton*)sender{
    NSLog(@"1");
 // 判断用户是否登录 ,登录则收藏, 存储到 collection表中
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        // 跳到登录页面
        GCLoginViewController *loginVC = [[GCLoginViewController alloc]init];
        [self presentViewController:loginVC animated:YES completion:^{
            NSLog(@"%@",[GCUserInfoManager getUserid]);
        }];
    }else{
//        存储
        NSLog(@"%@",[GCUserInfoManager getUserid]);
      GCDatabaseManager *mananger = [GCDatabaseManager defaultManager];
        [mananger insertCellWithModel:self.model userid:[GCUserInfoManager getUserid] cellId:[NSString stringWithFormat:@"%@",self.model.aid]];
    }
}

// 分享
- (void)shareAction:(UIButton*)sender{
    if (![[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"570dbc26e0f55a08be00055f"
                                          shareText:@"你要分享的文字"
                                         shareImage:[UIImage imageNamed:@"icon.png"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatTimeline,UMShareToWechatSession,UMShareToSina,UMShareToQQ,nil]
                                           delegate:self];
    }
    
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
