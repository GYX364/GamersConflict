//
//  TestViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "TestViewController.h"
#import "GCCircularButton.h"

#define kColor arc4random()%256 / 255.0

#define kCos60 0.866
#define kSin60 0.5

#define kPointX ScreenWidth / 2.0 - 50
#define kPointY ScreenHeight / 2.0 - 50
#define kRadius 40.0


@interface TestViewController ()
//@property (nonatomic, strong)GCCircularButton *button1;
//@property (nonatomic, strong)GCCircularButton *button2;
//@property (nonatomic, strong)GCCircularButton *button3;
@property (nonatomic, strong)UIButton *moreButton;
@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *button3;
@property (nonatomic, strong)UIButton *button4;
@property (nonatomic, strong)UIButton *button5;
@property (nonatomic, strong)UIButton *button6;

@property (nonatomic, strong)UIView *view1;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 布局button
    [self layoutButton];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)bAction:(UIButton *)sender{
    self.view.backgroundColor = [UIColor colorWithRed:kColor green:kColor blue:kColor alpha:1];
//    [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/255.0 alpha:1];
    [self open];
    
}

// 布局button
- (void)layoutButton{
    self.moreButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth / 2.0 - 50, ScreenHeight / 2.0 - 50, 2 * kRadius, 2 * kRadius)];
    self.moreButton.layer.masksToBounds = YES;
    self.moreButton.layer.cornerRadius = kRadius;
    self.moreButton.backgroundColor = [UIColor grayColor];
    [self.moreButton addTarget:self action:@selector(bAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.moreButton];

    NSLog(@"%f,%f",ScreenWidth,ScreenHeight);
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(kPointX - 2 * kRadius * kCos60 - 20, kPointY - 2 * kRadius * kSin60 - 20, 40, 40)];
    self.button1.backgroundColor = [UIColor grayColor];
    self.button1.layer.cornerRadius = 20.0;
    [self.view addSubview:self.button1];
    
//    self.button2 = [UIButton alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
}


- (void)open{
    [UIView animateKeyframesWithDuration:1 delay:0.2 options:(0   ) animations:^{
        // 逐个添加关键帧
//        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
//           CGPoint point1 = CGPointMake(100, 75);
////            self.button1.frame.origin = point1;
//            self.button1.frame = CGRectMake(100, 75, 40, 40);
//            
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.25 animations:^{
//            CGPoint point2 = CGPointMake(125, 100);
////            self.button2.frame.origin = point2;
//            self.button2.frame = CGRectMake(125, 100, 40, 40);
//            
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.25 animations:^{
//            self.button3.frame = CGRectMake(100, 125, 40, 40);
//        }];
        [self.view1 setAlpha:1];
        [self.button1 setFrame:CGRectMake(40, 100, 60, 60)];
        [self.button2 setFrame:CGRectMake(100, 160, 60, 60)];
        [self.button3 setFrame:CGRectMake(160, 100, 60, 60)];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
