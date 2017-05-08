//
//  WBAuthenticationVC.m
//  BXYJWB
//
//  Created by MS on 17/1/19.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBAuthenticationVC.h"
#import "AppDelegate+WBDelegateRootController.h"
#import "WBIntroduceFile.h"
#import "WBIdentityBtn.h"

@interface WBAuthenticationVC ()

@property(nonatomic,strong)UITextField* identity;
@property(nonatomic,strong)UIButton* ensureBtn;
@property(nonatomic,strong)WBIdentityBtn* businessBtn;
@property(nonatomic,strong)WBIdentityBtn* groupBtn;
@property(nonatomic,strong)WBIdentityBtn* agentBtn;

@end

@implementation WBAuthenticationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self identity];
    [self businessBtn];
    [self groupBtn];
    [self agentBtn];
    [self ensureBtn];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.identity resignFirstResponder];
}

#pragma mark - 懒加载
-(UITextField *)identity{
    if (!_identity) {
        _identity = [LRPackage createTextFiledWithFrame:CGRectZero andWithPlaceHoder:@"身份验证码" andWithTextColor:LIGHTGRAY andWithTextSize:15];
        _identity.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:_identity];
        [_identity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREENWIDTH/3*2+20, 50));
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view.mas_centerY).with.offset(-SCREENWIDTH/3);
        }];
    }
    return _identity;
}

-(WBIdentityBtn *)businessBtn{
    if (!_businessBtn) {
        _businessBtn = [[WBIdentityBtn alloc] init];
        _businessBtn.selected = NO;
        [_businessBtn setTitle:@"营业部" forState:UIControlStateNormal];
        [_businessBtn addTarget:self action:@selector(business:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_businessBtn];
        [_businessBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 35));
            make.centerY.equalTo(self.view.mas_centerY).with.offset(-SCREENWIDTH/3+55);
            make.trailing.equalTo(self.groupBtn.mas_leading).with.offset(-10);
        }];
    }
    return _businessBtn;
}

-(WBIdentityBtn *)groupBtn{
    if (!_groupBtn) {
        _groupBtn = [[WBIdentityBtn alloc] initWithFrame:CGRectZero];
        [_groupBtn setTitle:@"小组" forState:UIControlStateNormal];
        _groupBtn.selected = NO;
        [_groupBtn addTarget:self action:@selector(group:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_groupBtn];
        [_groupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 35));
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view.mas_centerY).with.offset(-SCREENWIDTH/3+55);
        }];
    }
    return _groupBtn;
}

-(WBIdentityBtn *)agentBtn{
    if (!_agentBtn) {
        _agentBtn = [[WBIdentityBtn alloc] initWithFrame:CGRectZero];
        [_agentBtn setTitle:@"经纪人" forState:UIControlStateNormal];
        _agentBtn.selected = NO;
        [_agentBtn addTarget:self action:@selector(agent:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_agentBtn];
        [_agentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 35));
            make.leading.equalTo(self.groupBtn.mas_trailing).with.offset(10);
            make.centerY.equalTo(self.view.mas_centerY).with.offset(-SCREENWIDTH/3+55);
        }];
    }
    return _agentBtn;
}

-(UIButton *)ensureBtn{
    if (!_ensureBtn) {
        _ensureBtn = [LRPackage createButtonWithFrame:CGRectZero andWithTitle:@"确定" andWithTitleColor:WHITE andWithBackGroudImage:nil target:self action:@selector(ensure:)];
        _ensureBtn.layer.cornerRadius = 8.0f;
        _ensureBtn.backgroundColor = ORANGE;
        [self.view addSubview:_ensureBtn];
        [_ensureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREENWIDTH/3*2, 50));
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view.mas_centerY).with.offset(30);
        }];
    }
    return _ensureBtn;
}

#pragma mark - 选择角色按钮
-(void)business:(UIButton*)sender{
    if (sender.selected) {
        sender.backgroundColor = RED;
        [WBFileCache saveUserData:@1 forKey:WB_USER_ROLE_KEY];
        self.groupBtn.selected = NO;
        self.groupBtn.backgroundColor = WHITE;
        self.agentBtn.selected = NO;
        self.agentBtn.backgroundColor = WHITE;
    }else{
        sender.backgroundColor = WHITE;
    }
    sender.selected = !sender.selected;
}

-(void)group:(UIButton*)sender{
    if (sender.selected) {
        sender.backgroundColor = RED;
        [WBFileCache saveUserData:@2 forKey:WB_USER_ROLE_KEY];
        self.businessBtn.selected = NO;
        self.businessBtn.backgroundColor = WHITE;
        self.agentBtn.selected = NO;
        self.agentBtn.backgroundColor = WHITE;
    }else{
        sender.backgroundColor = WHITE;
    }
    sender.selected = !sender.selected;
}

-(void)agent:(UIButton*)sender{
    if (sender.selected) {
        sender.backgroundColor = RED;
        [WBFileCache saveUserData:@3 forKey:WB_USER_ROLE_KEY];
        self.businessBtn.selected = NO;
        self.businessBtn.backgroundColor = WHITE;
        self.groupBtn.selected = NO;
        self.groupBtn.backgroundColor = WHITE;
    }else{
        sender.backgroundColor = WHITE;
    }
    sender.selected = !sender.selected;
}

#pragma mark - 确定按钮点击
-(void)ensure:(UIButton*)sender{
    if ((self.identity.text.intValue == 1 && [[WBFileCache readUserDataForKey:WB_USER_ROLE_KEY] intValue] == 3) || (self.identity.text.intValue == 2 && [[WBFileCache readUserDataForKey:WB_USER_ROLE_KEY] intValue] != 3)) {
        WBAlertView* alertView = [[WBAlertView alloc] initWithTitle:nil message:@"口令错误" sureBtn:@"确认" cancleBtn:nil];
        [alertView showMKPAlertView];
        return;
    }
    
    //存储口令
    [WBFileCache saveUserData:self.identity.text forKey:WB_USER_WORD_CMD_KEY];
    
    if (self.identity.text.integerValue == 1 && [[WBFileCache readUserDataForKey:WB_USER_ROLE_KEY] intValue] != 3) {
        //跳转到部长、组长界面
        AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        [app setTabbarController];
        [app setRootViewController];
        return;
    }
    
    if (self.identity.text.integerValue == 2 && [[WBFileCache readUserDataForKey:WB_USER_ROLE_KEY] intValue] == 3) {
        //跳转到经纪人界面
        AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        [app setAgentTabbarController];
        [app setRootViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
