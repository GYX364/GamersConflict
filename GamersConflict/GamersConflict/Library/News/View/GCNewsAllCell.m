//
//  GCNewsAllCell.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/21.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsAllCell.h"
#import "GCBaseModel.h"
#import "GCNewsSubModel.h"
#import <UIImageView+WebCache.h>

#define kBoldFontSize 15

@interface GCNewsAllCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *litpic;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *writerImg;
@property (weak, nonatomic) IBOutlet UIImageView *timerImg;
@property (weak, nonatomic) IBOutlet UIImageView *clickImg;
@property (weak, nonatomic) IBOutlet UIImageView *commentImg;

@property (nonatomic, assign) BOOL isSetDate;

@end

@implementation GCNewsAllCell

- (void)setDataWithModel:
    (GCBaseModel *)model {
    self.isSetDate = YES;
    
    [super setDataWithModel:model];
    
    [self setLabelsStyle];
    
    GCNewsSubModel *subModel = (GCNewsSubModel *)model;
    self.titleLabel.text = subModel.longtitle;
    self.writerLabel.text = subModel.writer;
    self.timerLabel.text = subModel.timer;
    self.clickLabel.text = [NSString stringWithFormat:@"%ld", subModel.click.integerValue];
    self.commentLabel.text = [NSString stringWithFormat:@"%ld", subModel.comment.integerValue];
    
    self.writerImg.image = [UIImage imageNamed:@"writer 2"];
    self.timerImg.image = [UIImage imageNamed:@"timer 2"];
    self.clickImg.image = [UIImage imageNamed:@"through 2"];
    self.commentImg.image = [UIImage imageNamed:@"comment 2"];
    
    [self.litpic sd_setImageWithURL:[NSURL URLWithString:subModel.litpic] placeholderImage:[UIImage imageNamed:@"placePic"]];
    
}

- (void)setCellWhenSelect {
    self.isSetDate = NO;
    
    [self setLabelsStyle];
    
    self.writerImg.image = [UIImage imageNamed:@"writer"];
    self.timerImg.image = [UIImage imageNamed:@"timer"];
    self.clickImg.image = [UIImage imageNamed:@"through"];
    self.commentImg.image = [UIImage imageNamed:@"comment"];
}

- (void)setLabelsStyle {
    [self setLabelstyle:self.titleLabel];
    [self setLabelstyle:self.writerLabel];
    [self setLabelstyle:self.timerLabel];
    [self setLabelstyle:self.clickLabel];
    [self setLabelstyle:self.commentLabel];
}

- (void)setLabelstyle:(UILabel *)label {
    
    label.font = [UIFont boldSystemFontOfSize:kBoldFontSize];
    
    if (self.isSetDate) {
        label.textColor = [UIColor blackColor];
        return;
    }
    label.textColor = [UIColor grayColor];
}




@end
