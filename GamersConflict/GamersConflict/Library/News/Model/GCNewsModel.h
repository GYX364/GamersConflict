//
//  GCNewsModel.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseModel.h"

typedef NS_ENUM(NSInteger, ClassName) {
    ClassRecommend,
    ClassOnlineGame,
    ClassMobileGame,
    ClassPCGame,
    ClassESports,
};

@interface GCNewsModel : GCBaseModel

@property (nonatomic, assign) ClassName classname;
@property (nonatomic, strong) NSString *classUrl;
@property (nonatomic, assign) BOOL isRequested;
@property (nonatomic, strong) NSMutableArray *newsArray;
@property (nonatomic, strong) NSString *moreUrl;
@property (nonatomic, assign) NSInteger start;

@end
