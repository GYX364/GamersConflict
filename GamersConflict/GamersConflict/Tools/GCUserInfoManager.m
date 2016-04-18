//
//  UserInfoManager.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCUserInfoManager.h"

@implementation GCUserInfoManager

+ (instancetype)defaultManager{
    static GCUserInfoManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GCUserInfoManager alloc]init];
    });
    return manager;
}

+ (void)conserveUserid:(NSString *)userid{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",userid] forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getUserid{
    NSString *userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"userid"];
    if (userid == nil) {
        return @" ";
    }
    return userid;
}

+ (void)cancelUserid{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userid"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (void)conserveUsername:(NSString *)username{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",username] forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getUsername{
    NSString *username = [[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
    if (username == nil) {
        return @" ";
    }
    return username;
}
@end
