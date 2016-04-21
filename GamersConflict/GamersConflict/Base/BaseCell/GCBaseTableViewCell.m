//
//  GCBaseTableViewCell.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseTableViewCell.h"

@implementation GCBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataWithModel:(GCBaseModel *)model {
    for (id control in self.subviews) {
        if ([control isKindOfClass:[UILabel class]]) {
            [(UILabel *)control setTextColor:[UIColor blackColor]];
            [(UILabel *)control setFont:[UIFont boldSystemFontOfSize:2]];
        }
    }
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)setCellWhenSelect {
    for (id control in self.subviews) {
        if ([control isKindOfClass:[UILabel class]]) {
            [(UILabel *)control setTextColor:[UIColor grayColor]];
        }
    }
}

@end
