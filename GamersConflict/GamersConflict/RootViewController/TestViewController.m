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
   
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, ScreenHeight - 400, ScreenWidth, 200)];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)bAction:(UIButton *)sender{
    self.view.backgroundColor = [UIColor colorWithRed:kColor green:kColor blue:kColor alpha:1];
//    [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/255.0 alpha:1];

    
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
