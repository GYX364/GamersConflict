//
//  GCCircularButton.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCCircularButton.h"

@implementation GCCircularButton


- (UIButton*)initWithRadius:(float)radius origin:(CGPoint)origin{
    
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(origin.x, origin.y, radius * 2, radius * 2)];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = radius;
    return button;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
