//
//  GCClassView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCClassView.h"
#import "GCClassSubView.h"

#define kCellWidth ((ScreenWidth - 60) / kClassCount)
#define kCellHeight 50
#define kCellInset 1
#define kClassCount 5

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface GCClassView()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

//@property (nonatomic, strong) UIScrollView *classesView;
@property (nonatomic, assign) NSInteger classesCount;
//@property (nonatomic, assign) NSInteger memoryIndex;

@property (nonatomic, assign) CGFloat panOrignX;
@property (nonatomic, assign) CGFloat panTranslateX;
@property (nonatomic, assign) BOOL animationBegin;
@property (nonatomic, strong) NSArray *classesIcon;

@end

@implementation GCClassView
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

//- (UIScrollView *)classesView {
//    if (_classesView == nil) {
//        _classesView = [[UIScrollView alloc] initWithFrame:self.bounds];
//        _classesView.delegate = self;
//        _classesView.contentSize = CGSizeMake(kCellWidth * (self.classesCount - 1) + kScreenWidth, 0);
//        _classesView.showsHorizontalScrollIndicator = NO;
//        _classesView.bounces = NO;
//        _classesView.decelerationRate = 0;
////        [self addSubview:_classesView];
//    }
//    return _classesView;
//}

- (instancetype)initWithFrame:(CGRect)frame classes:(NSArray *)classes {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.classesIcon = @[@"recommend", @"onlinegame", @"mobilegame", @"pcgame", @"esports"];
        [self addSubviewWithClasses:classes];
        [self setClassViewWithIndex:0];
    }
    return self;
}

//- (void)setClassWithViewIndex:(NSInteger)viewIndex {
//    if (viewIndex != self.currentIndex) {
//        self.currentIndex = viewIndex;
//        [UIView animateWithDuration:0.5 animations:^{
//            self.classesView.contentOffset = CGPointMake(viewIndex * kCellWidth, 0);
//        }];
//        [self setClassWithIndex:self.currentIndex forScrollView:self.classesView];
//    }
//}

- (void)addSubviewWithClasses:(NSArray *)classes {
    
    if (classes.count > 0) {
        self.classesCount = classes.count;
        for (NSInteger i = 0; i < classes.count; i ++) {
//            GCClassSubView *subView = [[GCClassSubView alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - kCellWidth / 2 + kCellWidth * i + kCellInset, 60, kCellWidth - kCellInset * 2, kCellHeight) classIcon:nil];
//            [self.classesView addSubview:subView];
            GCClassSubView *subView = [[GCClassSubView alloc] initWithFrame:CGRectMake(60 + kCellWidth * i, 0, kCellWidth, kCellHeight) classIcon:self.classesIcon[i]];
//            subView.backgroundColor = [UIColor blackColor];
            [self addSubview:subView];
        }
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        pan.delegate = self;
        [self addGestureRecognizer:pan];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.panOrignX = [[touches anyObject] locationInView:self].x;
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    CGPoint point = [pan translationInView:self];
    self.panTranslateX = self.panOrignX + point.x;
    if (self.panTranslateX < 50) {
        return;
    }
    
    if (self.animationBegin == NO && self.panTranslateX > 50) {
        self.animationBegin = YES;
        [self classViewWillAnimationWithPointX:self.panTranslateX];
    }
    
    [self classViewAnimationWithPointX:self.panTranslateX];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.classIndex) {
            self.classIndex([self indexOfViewWithPointX:self.panTranslateX]);
            
            [self setClassViewWithIndex:[self indexOfViewWithPointX:self.panTranslateX]];
            
            self.animationBegin = NO;
        }
    }
}

- (void)classViewWillAnimationWithPointX:(float)pointX {
    [UIView animateWithDuration:0.3 animations:^{
        [self classViewAnimationWithPointX:pointX];
    }];
}

- (void)classViewAnimationWithPointX:(float)pointX {
    for (NSInteger i = 0; i < self.classesCount; i ++) {
        GCClassSubView *subView = self.subviews[i];
        float absolutY = [self getAbsoluteValue:(CGRectGetMinX(subView.frame) + kCellWidth / 2.0 - pointX) / (ScreenWidth - 60) * 2.0 * 60];
        CGRect rect = CGRectMake(CGRectGetMinX(subView.frame), absolutY, kCellWidth, kCellHeight);
        subView.frame = rect;
    }
}

- (void)setClassViewWithIndex:(NSInteger)index {
    if (index > self.classesCount - 1 || index < 0) {
        return;
    }
    [UIView animateWithDuration:0.3 animations:^{
        for (NSInteger i = 0; i < self.classesCount; i ++) {
            GCClassSubView *subView = self.subviews[i];
            CGRect rect = CGRectMake(CGRectGetMinX(subView.frame), 60, kCellWidth, kCellHeight);
            if (i == index) {
                rect = CGRectMake(CGRectGetMinX(subView.frame), 0, kCellWidth, kCellHeight);
            }
            subView.frame = rect;
        }
    }];
    
}

- (float)getAbsoluteValue:(float)value {
    return value > 0 ? value : - value;
}

- (NSInteger)indexOfViewWithPointX:(float)pointX {
    return (pointX - 60) / kCellWidth;
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    [self scrollViewDidEndDecelerating:scrollView];
//}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSArray *subViews = scrollView.subviews;
//    CGPoint offset = scrollView.contentOffset;
//    float x = offset.x;
//    NSInteger index = [self indexOfViewWillStopWithScrollView:scrollView];
//    self.currentIndex = index;
//    //    NSLog(@"index = %ld x = %f", index, x);
//    NSInteger headViewIndex = [self calculatindex:index - 5];
//    NSInteger footViewIndex = [self calculatindex:index + 6];
//    for (NSInteger i = headViewIndex; i < footViewIndex; i ++) {
//        float subViewOffsetX = (i * kCellWidth - x) > 0 ? (i * kCellWidth - x) : (x - kCellWidth * i);
//        GCClassSubView *subView = subViews[i];
//        CGRect frame = subView.frame;
//        subView.frame = CGRectMake(frame.origin.x, 60 - kCellHeight * (1 - subViewOffsetX / ScreenWidth * 2), frame.size.width, frame.size.height);
//    }
//    if (x == self.memoryIndex) {
//        [self scrollViewDidEndDecelerating:self.classesView];
//    }
//}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSInteger index = [self indexOfViewWillStopWithScrollView:scrollView];
//    if (self.classIndex) {
//        self.classIndex(index);
//    }
//    [self setClassWithIndex:index forScrollView:scrollView];
//}
//
//- (void)setClassWithIndex:(NSInteger)index forScrollView:(UIScrollView *)scrollView {
//    NSArray *subViews = scrollView.subviews;
//    NSInteger headViewIndex = [self calculatindex:index - 5];
//    NSInteger footViewIndex = [self calculatindex:index + 6];
//    for (NSInteger i = headViewIndex; i < footViewIndex; i ++) {
//        if (i != index) {
//            GCClassSubView *subView = subViews[i];
//            CGRect frame = subView.frame;
//            [UIView animateWithDuration:0.4 animations:^{
//                scrollView.contentOffset = CGPointMake(kCellWidth * index, 0);
//                subView.frame = CGRectMake(frame.origin.x, 100, frame.size.width, frame.size.height);
//            }];
//        } else {
//            GCClassSubView *subView = subViews[i];
//            CGRect frame = subView.frame;
//            [UIView animateWithDuration:0.4 animations:^{
//                subView.frame = CGRectMake(frame.origin.x, 40, frame.size.width, frame.size.height);
//            }];
//        }
//    }
//}


//- (NSInteger)calculatindex:(NSInteger)index {
//    if (index < 0) {
//        return 0;
//    } else if (index > self.classesCount) {
//        return self.classesCount;
//    }
//    return index;
//}

//- (NSInteger)indexOfViewWillStopWithScrollView:(UIScrollView *)scrollView {
//    CGPoint offset = scrollView.contentOffset;
//    float x = offset.x;
//    if (x > kCellWidth / 2) {
//        return (NSInteger)((x + kCellWidth / 2) / kCellWidth);
//    }
//    return 0;
//}



@end
