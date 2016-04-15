//
//  GCClassView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCClassView.h"
#import "GCClassSubView.h"

#define kCellWidth 40
#define kCellHeight 60
#define kCellInset 1

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface GCClassView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *classesView;
@property (nonatomic, assign) NSInteger classesCount;
@property (nonatomic, assign) NSInteger memoryIndex;

@end

@implementation GCClassView
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (UIScrollView *)classesView {
    if (_classesView == nil) {
        _classesView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _classesView.delegate = self;
        _classesView.contentSize = CGSizeMake(kCellWidth * (self.classesCount - 1) + kScreenWidth, 0);
        _classesView.showsHorizontalScrollIndicator = NO;
        _classesView.bounces = NO;
        _classesView.decelerationRate = 0;
        [self addSubview:_classesView];
    }
    return _classesView;
}

- (instancetype)initWithFrame:(CGRect)frame classes:(NSArray *)classes {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviewWithClasses:classes];
    }
    return self;
}

- (void)addSubviewWithClasses:(NSArray *)classes {
    
    if (classes.count > 0) {
        self.classesCount = classes.count;
        for (NSInteger i = 0; i < classes.count; i ++) {
            GCClassSubView *subView = [[GCClassSubView alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - kCellWidth / 2 + kCellWidth * i + kCellInset, 40, kCellWidth - kCellInset * 2, kCellHeight) classIcon:nil];
            subView.backgroundColor = [UIColor grayColor];
            [self.classesView addSubview:subView];
        }
    } else {
        for (NSInteger i = 0; i < 29; i ++) {
            self.classesCount = 29;
            GCClassSubView *subView = [[GCClassSubView alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - kCellWidth / 2 + kCellWidth * i + kCellInset, 40, kCellWidth - kCellInset * 2, kCellHeight) classIcon:nil];
            subView.backgroundColor = [UIColor grayColor];
            [self.classesView addSubview:subView];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray *subViews = scrollView.subviews;
    CGPoint offset = scrollView.contentOffset;
    float x = offset.x;
    NSInteger index = [self indexOfViewWillStopWithScrollView:scrollView];
    NSLog(@"index = %ld x = %f", index, x);
    NSInteger headViewIndex = [self calculatindex:index - 5];
    NSInteger footViewIndex = [self calculatindex:index + 6];
    for (NSInteger i = headViewIndex; i < footViewIndex; i ++) {
        float subViewOffsetX = (i * kCellWidth - x) > 0 ? (i * kCellWidth - x) : (x - kCellWidth * i);
        GCClassSubView *subView = subViews[i];
        CGRect frame = subView.frame;
        subView.frame = CGRectMake(frame.origin.x, 40 - kCellHeight * (1 - subViewOffsetX / ScreenWidth * 2), frame.size.width, frame.size.height);
    }
    if (x == self.memoryIndex) {
        [self scrollViewDidEndDecelerating:self.classesView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSArray *subViews = scrollView.subviews;
    NSInteger index = [self indexOfViewWillStopWithScrollView:scrollView];
    NSInteger headViewIndex = [self calculatindex:index - 5];
    NSInteger footViewIndex = [self calculatindex:index + 6];
    for (NSInteger i = headViewIndex; i < footViewIndex; i ++) {
        if (i != index) {
            GCClassSubView *subView = subViews[i];
            CGRect frame = subView.frame;
            [UIView animateWithDuration:0.4 animations:^{
                scrollView.contentOffset = CGPointMake(kCellWidth * index, -20);
                subView.frame = CGRectMake(frame.origin.x, 40, frame.size.width, frame.size.height);
            }];
        }
    }
}


- (NSInteger)calculatindex:(NSInteger)index {
    if (index < 0) {
        return 0;
    } else if (index > self.classesCount) {
        return self.classesCount;
    }
    return index;
}

- (NSInteger)indexOfViewWillStopWithScrollView:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    float x = offset.x;
    if (x > kCellWidth / 2) {
        return (NSInteger)((x + kCellWidth / 2) / kCellWidth);
    }
    return 0;
}


@end
