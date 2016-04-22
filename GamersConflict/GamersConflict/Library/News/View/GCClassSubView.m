//
//  GCClassSubView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCClassSubView.h"

@interface GCClassSubView()

@property (nonatomic, strong) UIImageView *iconView;

@end
@implementation GCClassSubView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 8, 0, self.bounds.size.width / 4 * 3, self.bounds.size.width / 4 * 3)];
        [self addSubview:_iconView];
    }
    return _iconView;
}

- (instancetype)initWithFrame:(CGRect)frame classIcon:(NSString *)icon {
    self = [super initWithFrame:frame];
    if (self) {
        self.iconView.image = [UIImage imageNamed:icon];
    }
    return self;
}


@end
