//
//  GCClearCache.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/21.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCClearCache : NSObject

// 计算Cache目录文件大小
+ (float)folderSizeOfPath:(NSString *)path;
// 根据路径清除缓存
+ (void)cleanCacheWithPath:(NSString *)path;
@end
