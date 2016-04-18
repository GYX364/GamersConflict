//
//  GCNewsContentViewController.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/18.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsContentViewController.h"

@interface GCNewsContentViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation GCNewsContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.html5 != nil) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.html5]]];
    }
}

- (IBAction)backToNews:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
