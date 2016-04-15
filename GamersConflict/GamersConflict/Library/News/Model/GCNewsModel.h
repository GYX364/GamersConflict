//
//  GCNewsModel.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseModel.h"

@interface GCNewsModel : GCBaseModel

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *classUrl;
@property (nonatomic, assign) BOOL isRequested;
@property (nonatomic, strong) NSMutableArray *articlesList;

@end
