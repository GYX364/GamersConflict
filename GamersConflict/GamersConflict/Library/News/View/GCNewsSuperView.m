//
//  GCNewsSuperView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsSuperView.h"
#import "GCNewsSubView.h"

@interface GCNewsSuperView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *ArticleListDic;

@end

@implementation GCNewsSuperView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame classes:(NSMutableArray *)classes
{
    self = [super initWithFrame:frame];
    if (self) {
        if (classes.count > 0) {
            [self settingScrollViewWithClasses:classes];
            [self addSubviewWithClasses:classes];
        }
        [self settingScrollViewWithClasses:classes];
        [self addSubviewWithClasses:classes];
    }
    return self;
}

- (void)settingScrollViewWithClasses:(NSMutableArray *)classes {
    self.delegate = self;
    self.contentSize = CGSizeMake(ScreenWidth * 10, 0);
    self.contentOffset = CGPointMake(0, 0);
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.autoresizesSubviews = YES;
}

- (void)addSubviewWithClasses:(NSMutableArray *)classes {
    for (NSInteger i = 0; i < 10; i ++) {
//        GCNewsSubView *subView = [[GCNewsSubView alloc] initWithFrame:CGRectMake(ScreenWidth * i + 5, 44, ScreenWidth - 10, ScreenHeight - 64 - 80 - 5)];
        //        subView.backgroundColor = [UIColor yellowColor];
        GCNewsSubView *subView = [[[NSBundle mainBundle] loadNibNamed:@"GCNewsSubView" owner:nil options:nil] firstObject];
        subView.frame = CGRectMake(ScreenWidth * i + 5, 44, ScreenWidth - 10, ScreenHeight - 64 - 80 - 5);
        [self addSubview:subView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f", scrollView.contentOffset.x);
    self.currentIndex = [self indexWithScrollView:self];
    NSLog(@"%ld", self.currentIndex);
}

- (NSInteger)indexWithScrollView:(UIScrollView *)scrollView {
    return scrollView.contentOffset.x / ScreenWidth;
}

@end
