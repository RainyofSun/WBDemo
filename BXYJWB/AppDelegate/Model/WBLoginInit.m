//
//  WBLoginInit.m
//  BXYJWB
//
//  Created by MS on 17/1/18.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBLoginInit.h"
#import <UMSocialCore/UMSocialCore.h>
#import "WBLoginAPI.h"
#import <UMMobClick/MobClick.h>

static WBLoginInit* login = nil;
@implementation WBLoginInit

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        login = [[WBLoginInit alloc] init];
    });
    return login;
}

-(void)initUmengWbLoginSDK{
    //设置友盟的appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:YMAPPKEY];
    //设置微博的appkey和appsecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                          appKey:YM_WB_LOGIN_KEY
                                       appSecret:YM_WB_LOGIN_SECRET
                                     redirectURL:YM_WB_REGRECT_URL];
}

-(void)initUmengCount{
    UMConfigInstance.appKey = YMAPPKEY;
    UMConfigInstance.channelId = @"App Store";
    [MobClick setLogEnabled:YES];
    [MobClick startWithConfigure:UMConfigInstance];
}

@end
