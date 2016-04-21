//
//  GCNewsSubModel.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/16.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsSubModel.h"

@interface GCNewsSubModel()

@end

@implementation GCNewsSubModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.subModel_description = value;
    }
}

- (NSMutableArray *)showItems {
    if (_showItems == nil) {
        _showItems = [NSMutableArray array];
    }
    return _showItems;
}


@end
