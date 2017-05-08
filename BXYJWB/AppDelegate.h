//
//  AppDelegate.h
//  BXYJWB
//
//  Created by yxkjios on 17/1/10.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UIViewController* viewController;

/**
 * 获取根视图导航控制器 
 */
+(UINavigationController*)rootNavigationController;

@end

