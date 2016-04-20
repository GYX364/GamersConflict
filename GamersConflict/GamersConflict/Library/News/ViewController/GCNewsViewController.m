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
    
    NSMutableArray *array = @[@{@"classUrl":GCRecommendURL, @"moreUrl":GCRecommendMoreURL}, @{@"classUrl":GCOnlineGameURL, @"moreUrl":GCOnlineGameMoreURL}, @{@"classUrl":GCMobileGameURL, @"moreUrl":GCMobileGameMoreURL}, @{@"classUrl":GCPCGameURL, @"moreUrl":GCPCGameMoreURL}, @{@"classUrl":GCESportsURL, @"moreUrl":GCESportsMoreURL}].mutableCopy;
    for (NSDictionary *dic in array) {
        GCNewsModel *model = [[GCNewsModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.classes addObject:model];
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0  blue:arc4random() % 256 / 256.0  alpha:1];
    
    [self refreshView];
}

- (void)refreshView {
//    self.class = [];
    if (self.view.subviews.count > 0) {
        [self.view.subviews performSelector:@selector(removeFromSuperview)];
    }
    
    GCClassView *classView = [[GCClassView alloc] initWithFrame:CGRectMake(0, ScreenHeight - StatusBarHeight - 80, ScreenWidth, 120) classes:self.classes];
    classView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:classView];
    
    
//    GCClassSuperView *classSuperView = [[[NSBundle mainBundle] loadNibNamed:@"GCClassSuperView" owner:nil options:nil] firstObject];
//    classSuperView.frame = CGRectMake(0, ScreenHeight - StatusBarHeight - 80, ScreenWidth, 120);
//    [classSuperView setClasses:self.classes];
//    [self.view addSubview:classSuperView];
    
    GCNewsSuperView *superView = [[GCNewsSuperView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 80) classes:self.classes];
    superView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:superView];
    
    classView.classIndex = ^(NSInteger currentIndex) {
        [superView setViewWithClassIndex:currentIndex];
    };
    
    superView.viewIndex = ^(NSInteger currentIndex) {
        [classView setClassWithViewIndex:currentIndex];
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
