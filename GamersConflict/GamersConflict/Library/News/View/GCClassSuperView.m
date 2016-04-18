//
//  GCClassSuperView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCClassSuperView.h"

#define kCellWidth 40
#define kCellHeight 60
#define kCellSpacing 6

@interface GCClassSuperView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *classesList;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation GCClassSuperView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSMutableArray *)classesList {
    if (_classesList == nil) {
        _classesList = [NSMutableArray array];
    }
    return _classesList;
}

- (void)awakeFromNib {
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor cyanColor];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(0, ScreenWidth / 2 - kCellWidth / 2, 0, ScreenWidth / 2 - kCellWidth / 2);
    layout.itemSize = CGSizeMake(kCellWidth, kCellHeight);
    layout.minimumLineSpacing = 6;
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)setClasses:(NSMutableArray *)classes {
    self.classesList = classes;
}

- (void)setClassWithViewIndex:(NSInteger)viewIndex {
    if (viewIndex != self.currentIndex) {
        self.currentIndex = viewIndex;
        [UIView animateWithDuration:0.5 animations:^{
            self.contentOffset = CGPointMake(viewIndex * kCellWidth, 0);
        }];
        [self setClassWithIndex:self.currentIndex forScrollView:self];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.classesList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    float x = offset.x;
    NSInteger index = [self indexOfViewWillStopWithScrollView:scrollView];
    self.currentIndex = index;
//    NSLog(@"index = %ld x = %f", index, x);
    NSInteger headViewIndex = [self calculatindex:index - 5];
    NSInteger footViewIndex = [self calculatindex:index + 6];
    for (NSInteger i = headViewIndex; i < footViewIndex; i ++) {
        float subViewOffsetX = (i * kCellWidth - x) > 0 ? (i * kCellWidth - x) : (x - kCellWidth * i);
        
    }
//    if (x == self.memoryIndex) {
//        [self scrollViewDidEndDecelerating:self.classesView];
//    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = [self indexOfViewWillStopWithScrollView:scrollView];
    if (self.classIndex) {
        self.classIndex(index);
    }
    [self setClassWithIndex:index forScrollView:scrollView];
}

- (void)setClassWithIndex:(NSInteger)index forScrollView:(UIScrollView *)scrollView {
    NSInteger headViewIndex = [self calculatindex:index - 5];
    NSInteger footViewIndex = [self calculatindex:index + 6];
    for (NSInteger i = headViewIndex; i < footViewIndex; i ++) {
        if (i != index) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
            UICollectionViewCell *cell = [self cellForItemAtIndexPath:indexPath];
            [UIView animateWithDuration:0.4 animations:^{
                scrollView.contentOffset = CGPointMake((kCellWidth + kCellSpacing) * index, 0);
            }];
        }
    }
}


- (NSInteger)calculatindex:(NSInteger)index {
    if (index < 0) {
        return 0;
    } else if (index > self.classesList.count) {
        return self.classesList.count;
    }
    return index;
}

- (NSInteger)indexOfViewWillStopWithScrollView:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    float x = offset.x;
    if (x > kCellWidth / 2 + kCellSpacing / 2) {
        return (NSInteger)((x + kCellWidth / 2 + kCellSpacing / 2) / (kCellWidth + kCellSpacing));
    }
    return 0;
}



@end
