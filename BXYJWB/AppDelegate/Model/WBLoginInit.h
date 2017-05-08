//
//  WBLoginInit.h
//  BXYJWB
//
//  Created by MS on 17/1/18.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBLoginInit : NSObject

+(instancetype)shareInstance;
/**
 * 初始化微博登录
 */
-(void)initUmengWbLoginSDK;
/**
 * 初始化友盟统计
 */
-(void)initUmengCount;
@end
