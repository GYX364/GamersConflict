//
//  GCNewsSuperView.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^viewIndex)(NSInteger currentIndex);

@interface GCNewsSuperView : UIScrollView

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) viewIndex viewIndex;

- (instancetype)initWithFrame:(CGRect)frame classes:(NSMutableArray *)classes;

- (void)setViewWithClassIndex:(NSInteger)classIndex;

@end
