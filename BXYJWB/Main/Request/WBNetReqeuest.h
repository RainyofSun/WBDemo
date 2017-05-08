//
//  WBNetReqeuest.h
//  BXYJWB
//
//  Created by MS on 17/2/7.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBNetReqeuest : NSObject

+(instancetype)shareInstance;
/**
 * 微博根据口令获取资源
 */
-(void)WB_ReqeustResourceWithParams:(NSDictionary*)params sucess:(void(^)(id responseObject))sucess;

@end
