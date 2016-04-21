//
//  GCClearCache.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/21.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCClearCache.h"
#import <SDImageCache.h>
@implementation GCClearCache
+ (float)folderSizeOfPath:(NSString *)path{
    NSFileManager *manager = [NSFileManager defaultManager];
    float size = 0.0;
    // 判断是否存在该文件
    if ([manager fileExistsAtPath:path]) {
        // 遍历该目录下文件,获得大小
        NSArray *childFile = [manager subpathsAtPath:path];
        for (NSString *fileName in childFile) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            size += [manager attributesOfItemAtPath:absolutePath error:nil].fileSize;
        }
        // 将大小转换为 M
        size +=[[SDImageCache sharedImageCache] getSize];
        return size /1024.0 / 1024.0;
    }
    return 0;
}

+ (void)cleanCacheWithPath:(NSString *)path{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        // 获取目录下文件
        NSArray *childFile = [manager subpathsAtPath:path];
        for (NSString *fileName in childFile) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            // 删除文件
            [manager removeItemAtPath:absolutePath error:nil];
        }
    }
}
@end
