//
//  GCLoginViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCLoginViewController.h"
#import <AFNetworking.h>
// 用于开启状态栏动画
//#import "AFNetworkActivityIndicatorManager.h"
// 状态栏小菊花
//#import "UIActivityIndicatorView+AFNetworking.h"
@interface GCLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

// AFNetWorkingHTTP请求对象
@property (nonatomic, strong)AFHTTPSessionManager *session;
@end

@implementation GCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化HTTP请求对象
    self.session = [AFHTTPSessionManager manager];
    // 设置支持内容类型  接口返回的数据类型
    self.session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    
    

}


- (IBAction)loginAction:(id)sender {
    // 请求  登陆
//    loginmode=username&password=6251728&platform=mobile&t=login&userName=gyx364
    // 创建POST请求Body
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"username" forKey:@"loginmode"];
    [dic setValue:self.passwordText.text forKey:@"password"];
    [dic setValue:@"moblile" forKey:@"platform"];
    [dic setValue:@"login" forKey:@"t"];
    [dic setValue:self.userNameText.text forKey:@"userName"];
    [self.session POST:GCLogin parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"登陆成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"登陆失败:%@",error);
    }];
}

- (IBAction)registerAction:(id)sender {
}

- (IBAction)backAction:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.userNameText resignFirstResponder];
    [self.passwordText resignFirstResponder];
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
