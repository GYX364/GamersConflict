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

@interface GCNewsAllCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *litpic;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *writerImg;
@property (weak, nonatomic) IBOutlet UIImageView *timerImg;
@property (weak, nonatomic) IBOutlet UIImageView *clickImg;
@property (weak, nonatomic) IBOutlet UIImageView *commentImg;


@end

@implementation GCNewsAllCell

- (void)setDataWithModel:(GCBaseModel *)model {
    [super setDataWithModel:model];
    
    GCNewsSubModel *subModel = (GCNewsSubModel *)model;
    self.titleLabel.text = subModel.longtitle;
    self.writerLabel.text = subModel.writer;
    self.pubDateLabel.text = subModel.timer;
    self.clickLabel.text = [NSString stringWithFormat:@"%ld", subModel.click.integerValue];
    self.commentLabel.text = [NSString stringWithFormat:@"%ld", subModel.comment.integerValue];
    
    self.titleLabel.textColor = [UIColor blackColor];
    self.writerLabel.textColor = [UIColor blackColor];
    self.pubDateLabel.textColor = [UIColor blackColor];
    self.clickLabel.textColor = [UIColor blackColor];
    self.commentLabel.textColor = [UIColor blackColor];
    
    self.writerImg.image = [UIImage imageNamed:@"writer 2"];
    self.timerImg.image = [UIImage imageNamed:@"timer 2"];
    self.clickImg.image = [UIImage imageNamed:@"through 2"];
    self.commentImg.image = [UIImage imageNamed:@"comment 2"];
    
    [self.litpic sd_setImageWithURL:[NSURL URLWithString:subModel.litpic] placeholderImage:nil];
}

- (void)setCellWhenSelect {
    self.titleLabel.textColor = [UIColor grayColor];
    self.writerLabel.textColor = [UIColor grayColor];
    self.pubDateLabel.textColor = [UIColor grayColor];
    self.clickLabel.textColor = [UIColor grayColor];
    self.commentLabel.textColor = [UIColor grayColor];
    
    self.writerImg.image = [UIImage imageNamed:@"writer"];
    self.timerImg.image = [UIImage imageNamed:@"timer"];
    self.clickImg.image = [UIImage imageNamed:@"through"];
    self.commentImg.image = [UIImage imageNamed:@"comment"];
}

@end
