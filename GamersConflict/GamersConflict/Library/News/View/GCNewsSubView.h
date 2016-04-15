//
//  GCNewsSubView.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCNewsModel;

@interface GCNewsSubView : UITableView

- (void)setDataWithModel:(GCNewsModel *)model;

@end
