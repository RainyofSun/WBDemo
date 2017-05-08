//
//  WBBaseViewController.m
//  BXYJWB
//
//  Created by MS on 17/1/10.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBBaseViewController.h"
#import "WBIntroduceFile.h"
#import "AppDelegate.h"

@interface WBBaseViewController ()

@property(nonatomic,strong)RTSpinKitView* spinView;

@end

@implementation WBBaseViewController

#pragma mark - VC.lifeCircle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self rdv_tabBarController].navigationItem.titleView = nil;
    if ([self isKindOfClass:[WBMessageVC class]] || [self isKindOfClass:[WBResourceVC class]] || [self isKindOfClass:[WBCommandVC class]]) {
        [self messageBar];
    }else{
        [self rdv_tabBarController].navigationItem.rightBarButtonItem = nil;
        [self rdv_tabBarController].navigationItem.leftBarButtonItem = nil;
    }
    [self rdv_tabBarController].navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : WHITE}];
    if (self.rdv_tabBarController.isTabBarHidden == self.isShowTabbar) {
        //返回正常的tabbar
        [self.rdv_tabBarController setTabBarHidden:!self.isShowTabbar];
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITE;
    self.isShowTabbar = YES;
    self.hidesBottomBarWhenPushed = YES;
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName : SETFONTSIZE(19),NSForegroundColorAttributeName : WHITE}];
    self.navigationController.navigationBar.tintColor = WHITE;
    [self setUpNav];
    [self createNavBar];
}

#pragma mark - 通知使用的方法
-(void)initStatusBar{
    
}

-(void)showStatusBarWithTitle:(NSString *)title{
    
}

-(void)changeStatusBarTitle:(NSString *)title{
    
}

-(void)hiddenStatusBar{
    
}

#pragma mark - Navgationitem.set
-(void)messageBar{
    if ([self isKindOfClass:[WBResourceVC class]]) {
        [self rdv_tabBarController].navigationItem.title = @"微博资源";
    }
    if ([self isKindOfClass:[WBMessageVC class]]){
        [self rdv_tabBarController].navigationItem.title = @"消息";
    }
    if ([self isKindOfClass:[WBCommandVC class]]) {
        [self rdv_tabBarController].navigationItem.title = @"口令";
    }
}

-(void)setUpNav{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
    [self messageBar];
}

-(void)createNavBar{
    self.view.backgroundColor = WHITE;
}

//展示没有数据的界面
-(void)showNoDataImage{
    
}
//移除没有数据的界面
-(void)removeNodataImage{
    
}
//提示是否需要登录
-(void)showShouldLoginPoint{
    
}

//分享URL
-(void)shareUrl:(NSString *)url title:(NSString *)title{
    
}

-(void)goToLogin{
    WBLoginVC* login = [[WBLoginVC alloc] init];
    [[AppDelegate rootNavigationController] pushViewController:login animated:YES];
}

-(void)showLoadingAnimation{
    RTSpinKitView* spinner = [[RTSpinKitView alloc] initWithStyle:RTSpinKitViewStyle9CubeGrid color:ARCDOMCOLOR];
    [self.view addSubview:spinner];
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    spinner.center = CGPointMake(CGRectGetMidX(screenBounds), CGRectGetMidY(screenBounds));
    [spinner startAnimating];
    self.spinView = spinner;
}

-(void)stopLoadingAnimation{
    [self.spinView stopAnimating];
    [self.spinView removeFromSuperview];
}

- (void)pop {
    if (self.navigationController == nil) return ;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRootVc {
    if (self.navigationController == nil) return ;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissWithCompletion:(void(^)())completion {
    [self dismissViewControllerAnimated:YES completion:completion];
}

- (void)presentVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentVc:vc completion:nil];
}

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentViewController:vc animated:YES completion:completion];
}

- (void)pushVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)removeChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc.view removeFromSuperview];
    [childVc willMoveToParentViewController:nil];
    [childVc removeFromParentViewController];
}

- (void)addChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc willMoveToParentViewController:self];
    [self addChildViewController:childVc];
    [self.view addSubview:childVc.view];
    childVc.view.frame = self.view.bounds;
}

-(BOOL)isNetworkReachable{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
