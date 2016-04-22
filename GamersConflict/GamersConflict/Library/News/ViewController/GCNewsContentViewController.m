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
#import "GCDatabaseManager.h"
@interface GCNewsContentViewController ()<UMSocialUIDelegate>{
    BOOL isShowing;
    BOOL have;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webTop;

// 更多按钮, 点出  分享 收藏
@property (nonatomic, strong)UIButton *moreButton;

// 收藏按钮
@property (nonatomic, strong)UIButton *collectionButton;

// 分享按钮
@property (nonatomic, strong)UIButton *shareButton;

@property (nonatomic, strong)GCDatabaseManager *manager;
@end

@implementation GCNewsContentViewController

- (void)viewWillAppear:(BOOL)animated{
    // 如果用户登录,判断该页面是否被收藏
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    have = NO;
    // 获取数据库对象
    self.manager = [GCDatabaseManager defaultManager];
    // 展示
    if ([self.model.type isEqualToString:@"all"]) {
        if (self.model.html5 != nil) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.html5]]];
        }
    } else if ([self.model.type isEqualToString:@"video"] || [self.model.type isEqualToString:@"pic"]) {
        if (self.model.url != nil) {
//            NSString *url = GCCell(self.model.aid);
//            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:GCCell(self.model.aid)]]];
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.murl]]];
        }
    }
    // 布局button 添加button 事件
    [self layoutButton];
    
    [self.collectionButton addTarget:self action:@selector(collectionAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.shareButton addTarget:self action:@selector(shareAction:) forControlEvents:(UIControlEventTouchUpInside)];
    if (![[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        if ([self.manager selectCellWithCellId:[NSString stringWithFormat:@"%@",self.model.aid]]) {
            //            [self.collectionButton setTitle:@"取消收藏" forState:(UIControlStateNormal)];
            self.collectionButton.backgroundColor = [UIColor redColor];
            have = YES;
        }else{
            self.collectionButton.backgroundColor = [UIColor grayColor];
            have = NO;
        }
    }
}

- (IBAction)backToNews:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

// 布局button
- (void)layoutButton{
    
    self.moreButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 80, 15, 40, 40)];
//    [self.moreButton setTitle:@"更多" forState:(UIControlStateNormal)];
    [self.moreButton setBackgroundImage:[UIImage imageNamed:@"extend.tif"] forState:(UIControlStateNormal)];
    self.moreButton.backgroundColor = [UIColor grayColor];
    self.moreButton.layer.cornerRadius = 20.0;
    self.moreButton.layer.masksToBounds = YES;
    [self.moreButton addTarget:self action:@selector(showAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.moreButton];
    
    // 收藏按钮
    self.collectionButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 80, 15, 40, 40)];
    self.collectionButton.alpha = 0.0;
//    [self.collectionButton setTitle:@"收藏" forState:(UIControlStateNormal)];
    [self.collectionButton setBackgroundImage:[UIImage imageNamed:@"favorite.tif"] forState:(UIControlStateNormal)];
    self.collectionButton.layer.masksToBounds = NO;
    self.collectionButton.layer.cornerRadius = 20.0;
    self.collectionButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionButton];
    
    // 分享按钮
    self.shareButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 80, 15, 40, 40)];
    self.shareButton.alpha = 0.0;
//    [self.shareButton setTitle:@"分享" forState:(UIControlStateNormal)];
    [self.shareButton setBackgroundImage:[UIImage imageNamed:@"share.tif"] forState:(UIControlStateNormal)];
//    self.shareButton.backgroundColor = [UIColor cyanColor];
    self.shareButton.backgroundColor = [UIColor grayColor];
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
            transform = CGAffineTransformRotate(self.moreButton.transform, 3 * M_PI_4);
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
            transform = CGAffineTransformRotate(self.moreButton.transform, 3 * M_PI_4);
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
    
 // 判断用户是否登录 ,登录则收藏, 存储到 collection表中
    if ([[GCUserInfoManager getUserid] isEqualToString:@" "]) {
        // 跳到登录页面
        GCLoginViewController *loginVC = [[GCLoginViewController alloc]init];
        [self presentViewController:loginVC animated:YES completion:^{
            
        }];
    }else{
        // 判断用户是否已经收藏,如果收藏则删除
        if (have) {
            [self.manager deleteCellModelWithCellId:[NSString stringWithFormat:@"%@",self.model.aid]];
//            [self.collectionButton setTitle:@"收藏" forState:(UIControlStateNormal)];
            self.collectionButton.backgroundColor = [UIColor grayColor];
            have = NO;
            NSLog(@"1");

        }else{
            GCDatabaseManager *mananger = [GCDatabaseManager defaultManager];
            [mananger insertCellWithModel:self.model userid:[GCUserInfoManager getUserid] cellId:[NSString stringWithFormat:@"%@",self.model.aid]];
//            [self.collectionButton setTitle:@"取消收藏" forState:(UIControlStateNormal)];
            self.collectionButton.backgroundColor = [UIColor redColor];
        
            NSLog(@"2");
            have = YES;
        }
//        存储
        

     
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
    }else{
        GCLoginViewController *loginVC = [[GCLoginViewController alloc]init];
        [self presentViewController:loginVC animated:YES completion:^{
            
        }];
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
