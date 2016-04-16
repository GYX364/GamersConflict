//
//  GCCollectionViewController.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseViewController.h"
@class GCBaseModel;
@interface GCCollectionViewController : GCBaseViewController
// 保存cellid的收藏列表
@property (nonatomic, strong)NSMutableArray *collectionArray;

// 保存Cell 各类信息model
@property (nonatomic, strong)GCBaseModel *model;

@end
