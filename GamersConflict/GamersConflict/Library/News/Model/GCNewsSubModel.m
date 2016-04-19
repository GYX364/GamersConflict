//
//  GCNewsSubModel.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/16.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsSubModel.h"

@interface GCNewsSubModel()<NSCoding>

@end

@implementation GCNewsSubModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.aid = [aDecoder decodeObjectForKey:@"aid"];
        self.subModel_description = [aDecoder decodeObjectForKey:@"subModel_description"];
        self.html5 = [aDecoder decodeObjectForKey:@"html5"];
        self.litpic = [aDecoder decodeObjectForKey:@"litpic"];
        self.longtitle = [aDecoder decodeObjectForKey:@"longtitle"];
        self.pubdate = [aDecoder decodeObjectForKey:@"pubdate"];
        self.source = [aDecoder decodeObjectForKey:@"source"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.murl = [aDecoder decodeObjectForKey:@"murl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.aid forKey:@"aid"];
    [aCoder encodeObject:self.subModel_description forKey:@"subModel_description"];
    [aCoder encodeObject:self.html5 forKey:@"html5"];
    [aCoder encodeObject:self.litpic forKey:@"litpic"];
    [aCoder encodeObject:self.longtitle forKey:@"longtitle"];
    [aCoder encodeObject:self.pubdate forKey:@"pubdate"];
    [aCoder encodeObject:self.source forKey:@"source"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.murl forKey:@"murl"];
}
@end
