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
    
    NSMutableArray *array = @[@{@"classUrl":GCRecommendURL}, @{@"classUrl":GCOnlineGameURL}, @{@"classUrl":GCMobileGameURL}, @{@"classUrl":GCPCGameURL}, @{@"classUrl":GCESportsURL}].mutableCopy;
    for (NSDictionary *dic in array) {
        GCNewsModel *model = [[GCNewsModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.classes addObject:model];
    }
    
    GCNewsSuperView *superView = [[GCNewsSuperView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 80) classes:self.classes];
    superView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:superView];
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
