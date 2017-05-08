//
//  AppDelegate+WBDelegateRootController.m
//  BXYJWB
//
//  Created by MS on 17/1/10.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "AppDelegate+WBDelegateRootController.h"
#import "WBIntroduceFile.h"

@interface AppDelegate ()<RDVTabBarControllerDelegate,UIScrollViewDelegate>

@end

@implementation AppDelegate (WBDelegateRootController)

-(void)setRootViewController{
    if ([WBUSERDEFAULT objectForKey:WB_FIRST_USE]) {
        //不是第一次安装
        [self setRoot];
    }else{
        UIViewController* emptyViewController = [[UIViewController alloc] init];
        self.window.rootViewController = emptyViewController;
        [self createLoadingScrollView];
    }
}

-(void)setRoot{
    UINavigationController* navc = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    navc.navigationBar.barTintColor = BLUE;
    [navc.navigationBar setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:WHITE}];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:SETFONTSIZE(19),NSForegroundColorAttributeName:WHITE}];
    navc.navigationBar.tintColor = WHITE;
    self.window.rootViewController = navc;
}

#pragma mark - 设置部长、组长界面
-(void)setTabbarController{
    WBResourceVC* resource = [[WBResourceVC alloc] init];
    WBCommandVC* command = [[WBCommandVC alloc] init];
    RDVTabBarController* tableController = [[RDVTabBarController alloc] init];
    [tableController setViewControllers:@[resource,command]];
    self.viewController = tableController;
    tableController.delegate = self;
    [self customizeTabBarForController:tableController type:1];
}

#pragma mark - 设置经纪人界面
-(void)setAgentTabbarController{
    WBResourceVC* resource = [[WBResourceVC alloc] init];
    WBMessageVC* message = [[WBMessageVC alloc] init];
    RDVTabBarController* tableController = [[RDVTabBarController alloc] init];
    [tableController setViewControllers:@[resource,message]];
    self.viewController = tableController;
    tableController.delegate = self;
    [self customizeTabBarForController:tableController type:2];
}
//-(void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    if ([viewController isKindOfClass:[WBResourceVC class]]) {
//        tabBarController.navigationItem.title = @"微博资源";
//    }
//    if ([viewController isKindOfClass:[WBMessageVC class]]) {
//        tabBarController.navigationItem.title = @"消息";
//    }
//}

-(void)customizeTabBarForController:(RDVTabBarController*)tabbarController type:(NSInteger)type{
    /*
     有问题   切换界面不正确  有待矫正   navigationTitle不正确
     */
    UIImage* finishedImage = [VTGeneralTool createImageWithColor:WHITE];
    UIImage* unfinishedImage = [VTGeneralTool createImageWithColor:WHITE];
    NSArray* tabBarItemImages = @[@"resource",@"message"];
    NSArray* selectedImages = @[@"resource_select",@"message_select"];
    NSArray* tabBarItems = @[@"资源",@"发消息"];
    //type ＝ 2 经纪人界面    type ＝ 1 部长、组长界面
    type == 1 ? tabBarItemImages = @[@"resource",@"command"] : tabBarItemImages;
    type == 1 ? selectedImages = @[@"resource_select",@"command_select"] : selectedImages;
    type == 1 ? tabBarItems = @[@"资源",@"口令"] : tabBarItems;
    NSInteger index = 0;
    [[tabbarController tabBar] setTranslucent:YES];//设置tabbar的透明度
    for (RDVTabBarItem* item in [[tabbarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage* selectImage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
        UIImage* unselectImage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
        [item setFinishedSelectedImage:selectImage withFinishedUnselectedImage:unselectImage];
        NSDictionary* unselectArr = @{NSFontAttributeName : SETFONTSIZE(11),
                                      NSForegroundColorAttributeName : BLACK};
        NSDictionary* selectArr = @{NSFontAttributeName : SETFONTSIZE(11),
                                    NSForegroundColorAttributeName : ORANGE};
        [item setUnselectedTitleAttributes:unselectArr];
        [item setSelectedTitleAttributes:selectArr];
        [item setTitle:tabBarItems[index]];
        index ++;
    }
}

-(void)setAppWindows{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = WHITE;
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : WHITE}];
}

#pragma mark - 引导页
-(void)createLoadingScrollView{
    UIScrollView* sc = [[UIScrollView alloc] initWithFrame:self.window.bounds];
    sc.pagingEnabled = YES;
    sc.delegate = self;
    sc.showsVerticalScrollIndicator = NO;
    sc.showsHorizontalScrollIndicator = NO;
    [self.window.rootViewController.view addSubview:sc];
    
    NSArray* arr = @[@"1",@"2",@"3",@"4",@"5"];
    for (int i = 0; i < arr.count; i++) {
        UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH*i, 0, SCREENWIDTH, SCREENHEIGHT)];
        img.image = CONTENTFILEIMAGE(arr[i]);
        [sc addSubview:img];
        img.userInteractionEnabled = YES;
        if (i == arr.count - 1) {
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake((self.window.frame.size.width/2)-50, SCREENHEIGHT - 110, 100, 40);
            btn.backgroundColor = CYANINE;
            [btn setTitle:@"开始体验" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goToMain) forControlEvents:UIControlEventTouchUpInside];
            [img addSubview:btn];
            [btn setTitleColor:WHITE forState:UIControlStateNormal];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = WHITE.CGColor;
        }
        sc.contentSize = CGSizeMake(SCREENWIDTH*arr.count, self.window.bounds.size.height);
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x > SCREENWIDTH* 4 + 30) {
        [self goToMain];
    }
}

-(void)goToMain{
    [WBUSERDEFAULT setObject:@"isone" forKey:WB_FIRST_USE];
    [WBUSERDEFAULT synchronize];
    [self setRoot];
}

@end
