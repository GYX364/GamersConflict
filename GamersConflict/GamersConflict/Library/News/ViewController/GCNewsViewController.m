//
//  GCNewsViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsViewController.h"

#import "GCNewsSuperView.h"
#import "GCNewsSubView.h"
#import "GCNewsModel.h"

#import "GCClassView.h"
#import "GCClassSubView.h"

@interface GCNewsViewController ()

@property (nonatomic, strong) NSMutableArray *classes;

@end

@implementation GCNewsViewController

- (NSMutableArray *)classes {
    if (_classes == nil) {
        _classes = [NSMutableArray array];
    }
    return _classes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    for (NSInteger i = 0; i < 5; i++) {
        GCNewsModel *model = [[GCNewsModel alloc] init];
        model.classname = i;
        [self.classes addObject:model];
    }
    
    [self refreshView];
}

- (void)refreshView {
//    self.class = [];
    if (self.view.subviews.count > 0) {
        [self.view.subviews performSelector:@selector(removeFromSuperview)];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(- ScreenHeight * (kBGVWHRate - 1) / 5, 0, ScreenHeight * kBGVWHRate, ScreenHeight)];
    imageView.image = [UIImage imageNamed:@"2"];
    imageView.alpha = 1;
    imageView.animationImages = @[[UIImage imageNamed:@"BGV1"], [UIImage imageNamed:@"BGV2"], [UIImage imageNamed:@"BGV3"]];
    imageView.animationDuration = 0.6f;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    GCClassView *classView = [[GCClassView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 50, ScreenWidth, 120) classes:self.classes];
    [self.view addSubview:classView];
    
    GCNewsSuperView *superView = [[GCNewsSuperView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 50) classes:self.classes];
    superView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:superView];
    
    classView.classIndex = ^(NSInteger currentIndex) {
        [superView setViewWithClassIndex:currentIndex];
    };
    
    superView.viewIndex = ^(NSInteger currentIndex) {
//        [classView setClassWithViewIndex:currentIndex];
        [classView setClassViewWithIndex:currentIndex];
    };

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
