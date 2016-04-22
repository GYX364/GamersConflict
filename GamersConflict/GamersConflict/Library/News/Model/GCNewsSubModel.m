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

// 编码
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.aid forKey:@"aid"];
    [aCoder encodeObject:self.subModel_description forKey:@"subModel_description"];
    [aCoder encodeObject:self.html5 forKey:@"html5"];
    [aCoder encodeObject:self.litpic forKey:@"litpic"];
    [aCoder encodeObject:self.longtitle forKey:@"longtitle"];
    [aCoder encodeObject:self.pubdate forKey:@"pubdate"];
    [aCoder encodeObject:self.source forKey:@"source"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.murl forKey:@"murl"];
    [aCoder encodeObject:self.type forKey:@"type"];
    [aCoder encodeObject:self.showitem forKey:@"showitem"];
    [aCoder encodeObject:self.writer forKey:@"write"];
    [aCoder encodeObject:self.timer forKey:@"timer"];
    [aCoder encodeObject:self.click forKey:@"click"];
    [aCoder encodeObject:self.comment forKey:@"comment"];
    [aCoder encodeObject:self.showtype forKey:@"showtype"];
    [aCoder encodeObject:self.showItems forKey:@"showItems"];
    
}

// 反编码
//aid; subModel_description html5 litpic longtitle pubdate
//source title url murl type showitem writer timer click comment showtype showItems
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.aid = [aDecoder decodeObjectForKey:@"aid"];
        self.subModel_description = [aDecoder decodeObjectForKey:@"subModel_description"];
        self.html5 = [aDecoder decodeObjectForKey:@"html5"];
        self.litpic = [aDecoder decodeObjectForKey:@"litpic"];
        self.longtitle = [aDecoder decodeObjectForKey:@"longtitle"];
        self.pubdate = [aDecoder decodeObjectForKey:@"pubdate"];
        self.source = [aDecoder decodeObjectForKey:@"source"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
        self.murl = [aDecoder decodeObjectForKey:@"murl"];
        self.type = [aDecoder decodeObjectForKey:@"type"];
        self.showitem = [aDecoder decodeObjectForKey:@"showitem"];
        self.writer = [aDecoder decodeObjectForKey:@"writer"];
        self.timer = [aDecoder decodeObjectForKey:@"timer"];
        self.click = [aDecoder decodeObjectForKey:@"click"];
        self.comment = [aDecoder decodeObjectForKey:@"comment"];
        self.showtype = [aDecoder decodeObjectForKey:@"showtype"];
        self.showItems = [aDecoder decodeObjectForKey:@"showItems"];
    }
    return self;
}
@end
