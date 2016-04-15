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

@implementation GamersConflictDelegate
- (void)applicationDidFinishLaunching:(UIApplication *)application{
    GCNewsViewController *newsVC = [[GCNewsViewController alloc] init];
    UINavigationController *newsNC = [[UINavigationController alloc] initWithRootViewController:newsVC];
    
    GCRootViewController *rootController = [[GCRootViewController alloc] initWithRootViewController:newsNC];
    self.rootViewController = rootController;
    
    self.window.rootViewController = rootController;
    
    self.window.backgroundColor = [UIColor whiteColor];
}
@end