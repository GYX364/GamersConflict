//
//  GCNewsSubViewCell.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/16.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseTableViewCell.h"

@class GCNewsSubModel;

@interface GCNewsSubViewCell : GCBaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *litpicImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setCellWithModel:(GCNewsSubModel *)model;

- (void)setCellWhenSelect;

@end
