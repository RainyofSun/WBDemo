//
//  AppDelegate+WBDelegateRootController.h
//  BXYJWB
//
//  Created by MS on 17/1/10.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (WBDelegateRootController)

/**
 * 首次启动轮播图
 */
-(void)createLoadingScrollView;
/**
 * 部长、组长tabbar实例
 */
-(void)setTabbarController;
/**
 * 经纪人tabbar实例
 */
-(void)setAgentTabbarController;
/**
 * window实例
 */
-(void)setAppWindows;
/**
 * 根视图
 */
-(void)setRootViewController;

@end
