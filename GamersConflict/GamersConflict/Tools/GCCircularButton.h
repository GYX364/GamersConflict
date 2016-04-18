//
//  GCCircularButton.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCCircularButton : UIButton
// 给出半径和frame 创建圆形button
- (UIButton*)initWithRadius:(float)radius origin:(CGPoint)origin;
@end
