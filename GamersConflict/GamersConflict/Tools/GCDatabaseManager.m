//
//  GCDatabaseManager.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCDatabaseManager.h"

@implementation GCDatabaseManager
// 单例
+ (instancetype)defaultManager{
    static GCDatabaseManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GCDatabaseManager alloc]init];
    });
    return manager;
}

// 初始化
- (instancetype)init{
    if (self = [super init]) {
        // 创建数据库
        // 路径
        NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [documents stringByAppendingPathComponent:@"GmaersConflict.sqlite"];
        NSLog(@"%@",path);
        // 通过FMDatabase 对象打开数据库
        self.database = [[FMDatabase alloc]initWithPath:path];
        BOOL isOpen = [self.database open];
        if (isOpen != NO) {

        }else{
            
            
        }
    }
    return self;
}

- (void)closeDB{
    [self.database close];
}

#pragma mark -- 创建表
- (void)createCollectionTable{
    NSString *sql = @"create table if not exists collection (cellid text primary key,userid text,cellModel BLOB);";
    BOOL isCreate = [self.database executeUpdate:sql];
    if (isCreate != NO) {
        
    }else{
        
    }
}

- (void)createTypeTable{
    NSString *sql = @"create table if not exists type (userid text, mod text);";
    BOOL isCreate = [self.database executeUpdate:sql];
    if (isCreate != NO) {

    }else{

        
    }
}

#pragma mark -- 表操作
// type
- (void)insertTypeWithMod:(NSString *)mod userid:(NSString *)userid{
    NSString *insert = [NSString stringWithFormat:@"insert into type (userid,mod) values (%@,%@);",userid,mod];
    [self.database executeUpdate:insert];
}

- (void)deleteTypeWithUserID:(NSString *)userid{
    NSString *delete = [NSString stringWithFormat:@"delete * from type where userid=%@",userid];
    [self.database executeUpdate:delete];
}

- (NSArray *)selectTypeWithUserId:(NSString *)userid{
    NSMutableArray *array = [NSMutableArray array];
    NSString *select = [NSString stringWithFormat:@"select * from type where userid=%@",userid];
    
    FMResultSet *result = [self.database executeQuery:select];
    while ([result next]) {
        NSString *mod = [result stringForColumn:@"mod"];
        [array addObject:mod];
    }
    return array;
}

// cell 表操作
- (void)insertCellWithModel:(GCNewsSubModel *)model userid:(NSString *)userid cellId:(NSString *)cellid{
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:model forKey:@"cellModel"];
    [archiver finishEncoding];
    FMResultSet *set = [self.database executeQuery:@"insert into collection (cellid,userid,cellModel) values(?,?,?)" withArgumentsInArray:@[cellid,userid,data]];
    [set next];
    

}

- (void)deleteCellModelWithCellId:(NSString *)cellID{
    NSString *delete = [NSString stringWithFormat:@"delete  from collection where cellid = %@",cellID];
   BOOL re =  [self.database executeUpdate:delete];
    
//    if (re) {
//        NSLog(@"delete success");
//    }else{
//        NSLog(@"delete faild");
//    }
}

- (NSArray *)selectCellModelWithUserId:(NSString *)userid{
    // 返回cellModel数组
    NSMutableArray *array = [NSMutableArray array];
    NSString *select = [NSString stringWithFormat:@"select * from collection where userid = %@",userid];
    FMResultSet *result = [self.database executeQuery:select];
    while ([result next]) {
        NSData *data = [result dataForColumn:@"cellModel"];
        // 反归档
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        GCNewsSubModel *model = [unarchiver decodeObjectForKey:@"cellModel"];
        [array addObject:model];
    }
    return  array;
}

- (BOOL)selectCellWithCellId:(NSString *)cellId{
    NSMutableArray *arr = [NSMutableArray array];
    NSString *select = [NSString stringWithFormat:@"select * from collection where cellid = %@",cellId];
    FMResultSet *result = [self.database executeQuery:select];
    while ([result next]) {
        return YES;
    }
    return NO;
}
@end
