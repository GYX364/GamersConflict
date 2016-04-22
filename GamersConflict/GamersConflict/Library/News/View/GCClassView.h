//
//  GCClassView.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^classIndex)(NSInteger currenIndex);

@interface GCClassView : UIView

@property (nonatomic, copy) classIndex classIndex;

@property (nonatomic, assign) NSInteger currentIndex;

- (instancetype)initWithFrame:(CGRect)frame classes:(NSArray *)classes;

- (void)setClassViewWithIndex:(NSInteger)index;

@end
