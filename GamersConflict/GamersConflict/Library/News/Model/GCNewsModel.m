//
//  GCNewsModel.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsModel.h"

@interface GCNewsModel()

@end

@implementation GCNewsModel

- (NSMutableArray *)newsArray {
    if (_newsArray == nil) {
        _newsArray = [NSMutableArray array];
    }
    return _newsArray;
}

- (NSString *)classUrl {
    switch (self.classname) {
        case ClassRecommend:
            _classUrl = GCRecommendURL;
            break;
        case ClassOnlineGame:
            _classUrl = GCOnlineGameURL;
            break;
        case ClassMobileGame:
            _classUrl = GCMobileGameURL;
            break;
        case ClassPCGame:
            _classUrl = GCPCGameURL;
            break;
        case ClassESports:
            _classUrl = GCESportsURL;
            break;
        default:
            break;
    }
    return _classUrl;
}

- (NSString *)moreUrl {
    switch (self.classname) {
        case ClassRecommend:
            _moreUrl = GCRecommendMoreURL(self.start);
            break;
        case ClassOnlineGame:
            _moreUrl = GCOnlineGameMoreURL(self.start);
            break;
        case ClassMobileGame:
            _moreUrl = GCMobileGameMoreURL(self.start);
            break;
        case ClassPCGame:
            _moreUrl = GCPCGameMoreURL(self.start);
            break;
        case ClassESports:
            _moreUrl = GCESportsMoreURL(self.start);
            break;
        default:
            break;
    }
    return _moreUrl;
}


@end
