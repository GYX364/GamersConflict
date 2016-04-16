//
//  GCNewsSubViewCell.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/16.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsSubViewCell.h"
#import "GCNewsSubModel.h"

#import <UIImageView+WebCache.h>

@interface GCNewsSubViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *litpicImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation GCNewsSubViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setCellWithModel:(GCNewsSubModel *)model {
    [self.litpicImgView sd_setImageWithURL:[NSURL URLWithString:model.litpic]];
    self.titleLabel.text = model.title;
}

@end
