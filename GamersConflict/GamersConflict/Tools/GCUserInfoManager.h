//
//  UserInfoManager.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCUserInfoManager : NSObject

// 创建管理者  (单例)
+ (instancetype)defaultManager;

// 保存用户userid
+ (void)conserveUserid:(NSString *)userid;
// 获取用户userid
+ (NSString *)getUserid;
// 取消用户userid
+ (void)cancelUserid;
// 保存用户username
+ (void)conserveUsername:(NSString *)username;
// 获取用户username
+ (NSString*)getUsername;


@end
