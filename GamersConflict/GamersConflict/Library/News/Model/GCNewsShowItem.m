//
//  GCNewsShowItem.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/21.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsShowItem.h"

@implementation GCNewsShowItem

- (Info)picSize {
    Info info = {0, 0};
    if (self.info.count > 0) {
    Info newInfo = {((NSNumber *)[self.info valueForKey:@"width"]).floatValue, ((NSNumber *)[self.info valueForKey:@"height"]).floatValue};
        return newInfo;
    }
    return info;
}

- (NSDictionary *)info {
    if (_info == nil) {
        _info = [NSMutableDictionary dictionary];
    }
    return _info;
}

//- (void)setValue:(id)value forKey:(NSString *)key {
//    if ([key isEqualToString:@"pic"]) {
//        self.pic = value;
//    } else if ([key isEqualToString:@"text"]) {
//        self.text = value;
//    } else if ([key isEqualToString:@"info"]) {
//        self.info = value;
//    }
//}

@end
