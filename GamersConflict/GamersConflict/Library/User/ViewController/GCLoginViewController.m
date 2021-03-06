//
//  GCLoginViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCLoginViewController.h"
#import <AFNetworking.h>
#import "GCRegisterViewController.h"
#import "GCRegisterViewController.h"
#import "GCUserInfoManager.h"
#import "GCMenuViewController.h"
// 用于开启状态栏动画
//#import "AFNetworkActivityIndicatorManager.h"
// 状态栏小菊花
//#import "UIActivityIndicatorView+AFNetworking.h"
@interface GCLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (nonatomic, strong)UILabel *alertLabel;

// AFNetWorkingHTTP请求对象
@property (nonatomic, strong)AFHTTPSessionManager *session;
@end

@implementation GCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *back = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"aess3.png"]];
//    [back setFrame:[UIScreen mainScreen].bounds];
//    1079 846
    [back setFrame:CGRectMake(0, 0, ScreenHeight / 1079 * 846, ScreenHeight)];
    
    
    [self.view insertSubview:back atIndex:0];
    back.center = CGPointMake(ScreenWidth / 2, ScreenHeight / 2);
    // 初始化HTTP请求对象
    self.session = [AFHTTPSessionManager manager];
    // 设置支持内容类型  接口返回的数据类型
    self.session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    // 警告Label
    self.alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth / 2 -100 , ScreenHeight / 2 , 150, 40)];
    self.alertLabel.alpha = 0.0;
    self.alertLabel.textAlignment = NSTextAlignmentCenter;
     self.alertLabel.backgroundColor = [UIColor lightGrayColor];
    
}


- (IBAction)loginAction:(id)sender {
    // 请求  登陆
    // 创建POST请求Body
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"username" forKey:@"loginmode"];
    [dic setValue:self.passwordText.text forKey:@"password"];
    [dic setValue:@"moblile" forKey:@"platform"];
    [dic setValue:@"login" forKey:@"t"];
    [dic setValue:self.userNameText.text forKey:@"userName"];
    [self.view addSubview:self.alertLabel];
    // 判断nameText和passWord是否为空
    if ([self.userNameText.text isEqualToString:@""] || [self.passwordText.text isEqualToString:@""]) {
        [self showAlertLabelWithMessage:@"输入框不能为空"];
    }else{
        [self.session POST:GCLogin parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([[responseObject objectForKey:@"code"] intValue] == 0) {
                // 通过UserDefaults 保存用户ID等信息
                [GCUserInfoManager conserveUserid:[[responseObject objectForKey:@"data"] objectForKey:@"userid"]];
                [GCUserInfoManager conserveUsername:[[responseObject objectForKey:@"data"] objectForKey:@"username"]];
                // 完成登录.返回上一页面
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }else{
                // 输入框不为空. 弹出具体错误信息
                [self showAlertLabelWithMessage:[responseObject objectForKey:@"msg"]];
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"登陆失败:%@",error);
        }];
    }
    
    
    
    
   
}

- (IBAction)registerAction:(id)sender {
    GCRegisterViewController *registerVC = [[GCRegisterViewController alloc]init];
    [self showViewController:registerVC sender:nil];
    
//    [self.navigationController pushViewController:registerVC animated:YES];
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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


- (void)showAlertLabelWithMessage:(NSString *)message{
    self.alertLabel.text = message;
    self.alertLabel.alpha = 1.0;
    [UIView animateWithDuration:2.0 animations:^{
        self.alertLabel.alpha = 0.0;
    } completion:^(BOOL finished) {
        
    }];

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
