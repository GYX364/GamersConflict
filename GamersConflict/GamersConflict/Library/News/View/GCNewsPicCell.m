//
//  GCNewsPicCell.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/21.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsPicCell.h"
#import "GCBaseModel.h"
#import "GCNewsSubModel.h"
#import "GCNewsShowItem.h"

#import <UIImageView+WebCache.h>

@interface GCNewsPicCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewA;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewB;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewC;

@end

@implementation GCNewsPicCell

- (void)setDataWithModel:(GCBaseModel *)model {
    [super setDataWithModel:model];
    GCNewsSubModel *subModel = (GCNewsSubModel *)model;
    
    self.titleLabel.text = subModel.title;
    self.writerLabel.text = subModel.writer;
    self.timerLabel.text = subModel.timer;
    self.clickLabel.text = subModel.click;
    
    [self.imageViewA sd_setImageWithURL:[NSURL URLWithString:((GCNewsShowItem *)subModel.showItems[self.imageViewA.tag]).pic] placeholderImage:nil];
    [self.imageViewB sd_setImageWithURL:[NSURL URLWithString:((GCNewsShowItem *)subModel.showItems[self.imageViewB.tag]).pic] placeholderImage:nil];
    [self.imageViewC sd_setImageWithURL:[NSURL URLWithString:((GCNewsShowItem *)subModel.showItems[self.imageViewC.tag]).pic] placeholderImage:nil];
}

@end
