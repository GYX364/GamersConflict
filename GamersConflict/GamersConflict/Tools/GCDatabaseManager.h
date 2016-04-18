//
//  GCDatabaseManager.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "GCBaseModel.h"
@interface GCDatabaseManager : NSObject
// 数据库单例对象
@property (nonatomic, strong)FMDatabase *database;

// 获取管理者
+ (instancetype)defaultManager;

// 关闭数据库
- (void)closeDB;

// 创建收藏cell 表
- (void)createCollectionTable;

// 创建用户喜好新闻类型 表
- (void)createTypeTable;

#pragma mark -- 表操作
// 插入 cellModel
- (void)insertCellWithModel:(GCBaseModel*)model userid:(NSString *)userid cellId:(NSString *)cellid;

// 插入 用户喜好新闻类型
- (void)insertTypeWithMod:(NSString *)mod userid:(NSString *)userid;

// 删除 cellModel 根据cellID
- (void)deleteCellModelWithCellId:(NSString *)cellID;

// 删除 type 根据UserId 删除全部,再重新循环插入
- (void)deleteTypeWithUserID:(NSString*)userid;

// 查询type 根据UserId
- (NSArray *)selectTypeWithUserId:(NSString *)userid;

// 查询cellMode 根据UserId
- (NSArray *)selectCellModelWithUserId:(NSString *)userid;


@end
