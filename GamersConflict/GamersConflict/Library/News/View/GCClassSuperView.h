//
//  GCClassSuperView.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^classIndex)(NSInteger currenIndex);

@interface GCClassSuperView : UICollectionView

@property (nonatomic, copy) classIndex classIndex;

- (void)setClasses:(NSMutableArray *)classes;

- (void)setClassWithViewIndex:(NSInteger)viewIndex;

@end
