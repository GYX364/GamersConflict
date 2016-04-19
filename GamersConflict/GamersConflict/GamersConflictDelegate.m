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
    
}


- (void)applicationWillTerminate:(UIApplication *)application{
    [GCUserInfoManager cancelUserid];
}
@end
