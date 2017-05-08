//
//  LRXML.h
//  YXDayUp
//
//  Created by MS on 16/9/9.
//  Copyright © 2016年 yxkjios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface LRXML : NSObject

/**
 * 网络请求单例
 */
+(instancetype)shareLrXml;
/**
 * 网络请求
 * @param url 请求的网络地址
 * @param soapBody 请求的传入的参数集合
 * @param methodName 方法名
 * @param nameSpace 命名空间
 */

-(void)SOAPData:(NSString *)url soapBody:(NSString *)soapBody methodName:(NSString*)methodName nameSpace:(NSString*)nameSpace success:(void (^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
