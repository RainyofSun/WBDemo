//
//  WBBaseViewController.h
//  BXYJWB
//
//  Created by MS on 17/1/10.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBBaseViewController : UIViewController

/**
 * 网络是否可用
 */
@property(nonatomic,assign)BOOL isNetworkReachable;
/**
 * 是否显示tabbar
 */
@property(nonatomic,assign)Boolean isShowTabbar;
/**
 * 显示没有数据的界面
 */
-(void)showNoDataImage;
/**
 * 移除无数据界面
 */
-(void)removeNodataImage;
/**
 * 需要登录
 */
-(void)showShouldLoginPoint;
/**
 * 加载视图
 */
-(void)showLoadingAnimation;
/**
 * 停止加载
 */
-(void)stopLoadingAnimation;
/**
 * 分享页面
 * @param url url
 * @param title 标题
 */
-(void)shareUrl:(NSString*)url title:(NSString*)title;

-(void)goToLogin;
-(void)createNavBar;

/**
 * 状态栏
 */
-(void)initStatusBar;
-(void)showStatusBarWithTitle:(NSString*)title;
-(void)changeStatusBarTitle:(NSString*)title;
-(void)hiddenStatusBar;

- (void)pop;

- (void)popToRootVc;

- (void)popToVc:(UIViewController *)vc;

- (void)dismiss;

- (void)dismissWithCompletion:(void(^)())completion;

- (void)presentVc:(UIViewController *)vc;

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion;

- (void)pushVc:(UIViewController *)vc;

@end
