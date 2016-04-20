//
//  GCNewsModel.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsModel.h"

@implementation GCNewsModel

- (NSMutableArray *)newsArray {
    if (_newsArray == nil) {
        _newsArray = [NSMutableArray array];
    }
    return _newsArray;
}

@end
