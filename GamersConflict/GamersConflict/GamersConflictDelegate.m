//
//  GamersConflictDelegate.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GamersConflictDelegate.h"
#import "GCRootViewController.h"
#import "GCNewsViewController.h"
#import "GCDatabaseManager.h"
#import "GCUserInfoManager.h"

#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "UMSocialQQHandler.h"
@implementation GamersConflictDelegate
- (void)applicationDidFinishLaunching:(UIApplication *)application{
    GCNewsViewController *newsVC = [[GCNewsViewController alloc] init];
    UINavigationController *newsNC = [[UINavigationController alloc] initWithRootViewController:newsVC];
    
    GCRootViewController *rootController = [[GCRootViewController alloc] initWithRootViewController:newsNC];
    UINavigationController *rootNC = [[UINavigationController alloc] initWithRootViewController:rootController];
    
    self.rootViewController = rootNC;
    
    self.window.rootViewController = rootNC;
    
    self.window.backgroundColor = [UIColor whiteColor];
//    NSString *cellid = @"315360";
//    NSLog(@"%@", GCCell(cellid));
    // 链接数据库.创建表
    GCDatabaseManager *manager = [GCDatabaseManager defaultManager];
    [manager createCollectionTable];
    [manager createTypeTable];
    
    
    // 友盟
    
    [UMSocialData setAppKey:@"570dbc26e0f55a08be00055f"];
    // 微信
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscape];
    [UMSocialWechatHandler setWXAppId:@"wx993dbfd61832f426" appSecret:@"ddfdd8859c168a9aec785a0d5ee58dfb" url:@"http://www.umeng.com/social"];
    // 新浪

    //第一个参数为新浪appkey,第二个参数为新浪secret，第三个参数是新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"1982942370"
            secret:@"531a0ddd30bd8f35fc4c5d555e234b81"
            RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    // QQ

    [UMSocialQQHandler setQQWithAppId:@"1105334364" appKey:@"oQsUtRbEaOFFktiY" url:@"http://www.umeng.com/social"];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//
//- (void)applicationWillTerminate:(UIApplication *)application{
//    [GCUserInfoManager cancelUserid];
//}
@end
