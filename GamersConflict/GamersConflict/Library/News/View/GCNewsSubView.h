//
//  GCNewsSubView.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCNewsModel;

@protocol refreshModel <NSObject>

- (void)refreshModel;

@end

@interface GCNewsSubView : UITableView

@property (nonatomic, assign) id<refreshModel> refreshDelegate;

- (void)setDataWithModel:(GCNewsModel *)model;

@end
