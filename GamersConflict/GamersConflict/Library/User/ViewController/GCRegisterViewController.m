//
//  GCRegisterViewController.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCRegisterViewController.h"
#import <AFNetworking.h>


@interface GCRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *rePasswordText;

// AFHTTPSession 网络请求对象
@property (nonatomic, strong)AFHTTPSessionManager *session;

@end

@implementation GCRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化网络请求对象
    self.session = [AFHTTPSessionManager manager];
    self.session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    UIImageView *back = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yld1.png"]];
    [back setFrame:[UIScreen mainScreen].bounds];
    [self.view insertSubview:back atIndex:0];
}

// 注册
- (IBAction)registerAction:(id)sender {
    // 请求注册
    // POSTBody
// code=tuwan&loginmode=username&password=6251728&t=register&userName=gyx365
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"tuwan" forKey:@"code"];
    [dic setValue:@"username" forKey:@"loginmode"];
    [dic setValue:self.passwordText.text forKey:@"password"];
    [dic setValue:@"register" forKey:@"t"];
    [dic setValue:self.userNameText.text forKey:@"userName"];
    
    if (self.rePasswordText.text != self.passwordText.text) {
        UILabel *alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 300, 100, 60)];
        alertLabel.text = @"密码不匹配";
        alertLabel.tag = 10001;
        alertLabel.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:alertLabel];
        [UIView animateWithDuration:0.5 animations:^{
            alertLabel.alpha = 0.0;
        } completion:^(BOOL finished) {
            for (UIView *subViews in [self.view subviews]) {
                if (subViews.tag == 10001) {
                    [subViews removeFromSuperview];
                }
            }
        }];
    }else{
//        [self.session POST:GCRegister parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@",responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"error -- %@",error);
//        }];
        
        [self.session POST:GCRegister parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }
    
   
    
//    self.session POS
}

// 返回
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
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
