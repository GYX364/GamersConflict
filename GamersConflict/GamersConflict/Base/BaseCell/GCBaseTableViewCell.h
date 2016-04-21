//
//  GCBaseTableViewCell.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCBaseModel;

@interface GCBaseTableViewCell : UITableViewCell

/**
 *  根据model配置cell上控件属性 子类可以重写该方法来满足各自需求来设置控件
 *
 *  @param model cell对应的model
 */
- (void)setDataWithModel:(GCBaseModel *)model;

- (void)setCellWhenSelect;

@end
