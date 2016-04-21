//
//  TestViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "TestViewController.h"


#define kColor arc4random()%256 / 255.0

#define kCos60 0.5
#define kSin60 0.866

#define kPointX CGRectGetMidX(self.moreButton.frame)
#define kPointY CGRectGetMidY(self.moreButton.frame)
#define kRadius 30.0

#define kWidth 50


@interface TestViewController ()

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
    self.moreButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth / 2.0 - 50 - 50, ScreenHeight / 2.0 - 50, 2 * kRadius, 2 * kRadius)];
    self.moreButton.layer.masksToBounds = YES;
    self.moreButton.layer.cornerRadius = kRadius;
    self.moreButton.backgroundColor = [UIColor grayColor];
    [self.moreButton addTarget:self action:@selector(bAction:) forControlEvents:(UIControlEventTouchUpInside)];
    

    NSLog(@"%f,%f",ScreenWidth,ScreenHeight);
//    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(kPointX - 2 * kRadius - 20, kPointY - 4 * kRadius * kSin60 - 20, kWidth, kWidth)];
    self.button1 = [[UIButton alloc]init];
    [self.button1 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame), CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    self.button1.backgroundColor = [UIColor grayColor];
    self.button1.layer.cornerRadius = kWidth / 2.0;
    [self.view addSubview:self.button1];
    ;
//    self.button2 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.moreButton.frame) - 20, kPointY - 4 * kRadius * kSin60 - 20, kWidth, kWidth)];
    self.button2 = [[UIButton alloc]init];
    [self.button2 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame), CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    self.button2.backgroundColor = [UIColor grayColor];
    self.button2.layer.cornerRadius = kWidth / 2;
    [self.view addSubview:self.button2];
    
//    self.button3 = [[UIButton alloc]initWithFrame:CGRectMake(kPointX + 4 * kRadius * kCos60 - 20, kPointY - 4 * kRadius * kSin60 - 20, kWidth, kWidth)];
    self.button3 = [[UIButton alloc]init];
    [self.button3 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame), CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    self.button3.backgroundColor = [UIColor grayColor];
    self.button3.layer.cornerRadius = kWidth / 2;
    [self.view addSubview:self.button3];
    
//    self.button4 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.button3.frame), kPointY + 4 * kRadius * kSin60 - 20, kWidth, kWidth)];
    self.button4 = [[UIButton alloc]init];
    [self.button4 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame), CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    self.button4.backgroundColor = [UIColor grayColor];
    self.button4.layer.cornerRadius = kWidth / 2.0;
    [self.view addSubview:self.button4];

//    self.button5 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.button2.frame), kPointY + 4 * kRadius * kSin60 - 20, kWidth, kWidth)];
    self.button5 = [[UIButton alloc]init];
    [self.button5 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame), CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    self.button5.backgroundColor = [UIColor grayColor];
    self.button5.layer.cornerRadius = kWidth / 2.0;
    [self.view addSubview:self.button5];
    
//    self.button6 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.button1.frame), kPointY + 4 * kRadius * kSin60 - 20, kWidth, kWidth)];
    self.button6 = [[UIButton alloc]init];
    [self.button6 setFrame:CGRectMake(CGRectGetMinX(self.moreButton.frame), CGRectGetMinY(self.moreButton.frame), kWidth, kWidth)];
    self.button6.backgroundColor = [UIColor grayColor];
    self.button6.layer.cornerRadius = kWidth / 2;
    [self.view addSubview:self.button6];
    [self.view addSubview:self.moreButton];
}


- (void)open{
   [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.3 initialSpringVelocity:5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
       [self.button1 setTransform:CGAffineTransformMakeTranslation(-(4 * kRadius * kCos60 ) , - (4 * kRadius * kSin60 ))];
       [self.button2 setTransform:CGAffineTransformMakeTranslation(0, - (4 * kRadius * kSin60))];
        [self.button3 setTransform:CGAffineTransformMakeTranslation((4 * kRadius * kCos60 ), - (4 * kRadius * kSin60 ))];
       [self.button4 setTransform:CGAffineTransformMakeTranslation((4 * kRadius * kCos60 ),(4 * kRadius * kSin60 ))];
       [self.button5 setTransform:CGAffineTransformMakeTranslation(0 , (4 * kRadius * kSin60 ))];
       [self.button6 setTransform:CGAffineTransformMakeTranslation(-(4 * kRadius * kCos60 ),(4 * kRadius * kSin60 ))];
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
