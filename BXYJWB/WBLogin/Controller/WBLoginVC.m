//
//  WBLoginVC.m
//  BXYJWB
//
//  Created by MS on 17/1/11.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBLoginVC.h"
#import "AppDelegate+WBDelegateRootController.h"
#import "WBIntroduceFile.h"
#import "WBLoginButton.h"
#import <UMSocialCore/UMSocialCore.h>

@interface WBLoginVC ()<WBLoginButtonDelegate>

@property(nonatomic,strong)UILabel* wbLogin;
@property(nonatomic,strong)WBLoginButton* loginBtn;

@end

@implementation WBLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self wbLogin];
    [self loginBtn];
}

#pragma mark - 懒加载
-(UILabel *)wbLogin{
    if (!_wbLogin) {
        UILabel* label = [LRPackage createLabelWithFrame:CGRectZero andWithText:@"微博登录" andWithTextColor:WHITE andWithLabelTextSize:18];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        _wbLogin = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(140, 40));
            make.center.mas_equalTo(self.view);
        }];
    }
    return _wbLogin;
}

-(WBLoginButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[WBLoginButton alloc] init];
        _loginBtn.delegate = self;
        [self.view addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(80, 80));
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view.mas_centerY).with.offset(-SCREENHEIGHT/8);
        }];
    }
    return _loginBtn;
}

#pragma mark - 登录按钮点击
-(void)touchLoginView:(id)sender{
    [self.wbLogin drainAway:1.5];
    /*
     微博第三方登录,登录成功之后跳转到输入口令界面,根据口令判断用户身份,现在处理是直接跳转到部长身份界面
     */
    [self performAfter:1.0 block:^{
        UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
        keyWindow.rootViewController = [[WBAuthenticationVC alloc] init];
    }];
}

#pragma mark - 第三方平台授权
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        
        // 第三方登录数据(为空表示平台未提供)
        // 授权数据
        NSLog(@" uid: %@", resp.uid);
        NSLog(@" openid: %@", resp.openid);
        NSLog(@" accessToken: %@", resp.accessToken);
        NSLog(@" refreshToken: %@", resp.refreshToken);
        NSLog(@" expiration: %@", resp.expiration);
        
        // 用户数据
        NSLog(@" name: %@", resp.name);
        NSLog(@" iconurl: %@", resp.iconurl);
        NSLog(@" gender: %@", resp.gender);
        
        // 第三方平台SDK原始数据
        NSLog(@" originalResponse: %@", resp.originalResponse);
        NSString* openid = nil;
        if (resp.openid == nil) {
            openid = @"";
        }else{
            openid = resp.openid;
        }
        NSString* name = nil;
        if (resp.name == nil) {
            name = @"";
        }else{
            name = resp.name;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
