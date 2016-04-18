//
//  TestViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "TestViewController.h"
#import "GCCircularButton.h"
@interface TestViewController ()
//@property (nonatomic, strong)GCCircularButton *button1;
//@property (nonatomic, strong)GCCircularButton *button2;
//@property (nonatomic, strong)GCCircularButton *button3;
@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *button3;
@property (nonatomic, strong)UIView *view1;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GCCircularButton *button = [[GCCircularButton alloc]initWithRadius:60.0 origin:CGPointMake(100, 100)];
    button.backgroundColor = [UIColor blackColor];
    
    [button addTarget:self action:@selector(bAction:) forControlEvents:(UIControlEventTouchUpInside)];
//    self.button1 = [[GCCircularButton alloc]initWithRadius:40 origin:CGPointMake(100, 100)];
//    self.button2 = [[GCCircularButton alloc]initWithRadius:40 origin:CGPointMake(100, 100)];
//    self.button3 = [[GCCircularButton alloc]initWithRadius:40 origin:CGPointMake(100, 100)];
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view1 setAlpha:0];
    [self.view addSubview:self.view1];
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 60, 60)];
    self.button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 60, 60)];
    self.button3 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 60, 60)];
    self.button1.backgroundColor = [UIColor grayColor];
    self.button2.backgroundColor = [UIColor cyanColor];
    self.button3.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [self.view1 addSubview:self.button1];
    [self.view1 addSubview:self.button2];
    [self.view1 addSubview:self.button3];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)bAction:(UIButton *)sender{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256 / 255.0 green:arc4random()%256/255.0 blue:arc4random()%256/ 255.0 alpha:1];
//    [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/255.0 alpha:1];
    [self open];
    
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
