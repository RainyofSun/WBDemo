//
//  LRXML.m
//  YXDayUp
//
//  Created by MS on 16/9/9.
//  Copyright © 2016年 yxkjios. All rights reserved.
//

#import "LRXML.h"
#import "SVProgressHUD.h"

static LRXML* xml = nil;

@interface LRXML ()

@property(nonatomic,strong)AFHTTPSessionManager* manager;

@end

@implementation LRXML

+(instancetype)shareLrXml{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (!xml) {
            xml = [[LRXML alloc]init];
            xml.manager = [AFHTTPSessionManager manager];
        }
    });
    return xml;
}

-(void)SOAPData:(NSString *)url soapBody:(NSString *)soapBody methodName:(NSString*)methodName nameSpace:(NSString*)nameSpace success:(void (^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    NSString* soapStr = [NSString stringWithFormat:
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                         "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                         "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                         "<soap:Body>"
                         "<%@ xmlns=\"%@\">%@</%@>"
                         "</soap:Body>"
                         "</soap:Envelope>",methodName,nameSpace,soapBody,methodName];
//    NSLog(@"输入的信息：%@",soapStr);
//    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    xml.manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //设置请求时间
    xml.manager.requestSerializer.timeoutInterval = 15.f;
    //返回NSData
    xml.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置请求头
    [xml.manager.requestSerializer setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [xml.manager.requestSerializer setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[soapStr length]] forHTTPHeaderField:@"Content-Length"];
    //设置HTTPBody
    [xml.manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError *__autoreleasing *error) {
        return soapStr;
    }];
    [xml.manager POST:url parameters:soapStr success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (responseObject == nil) {
            return ;
        }
        // 把返回的二进制数据转为字符串
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        // 利用正则表达式取出<return></return>之间的字符串
        NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"(?<=return\\>).*(?=</return)" options:NSRegularExpressionCaseInsensitive error:nil];
        
        NSDictionary *dict = [NSDictionary dictionary];
        for (NSTextCheckingResult *checkingResult in [regular matchesInString:result options:0 range:NSMakeRange(0, result.length)]) {
            
            // 得到字典
            dict = [NSJSONSerialization JSONObjectWithData:[[result substringWithRange:checkingResult.range] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        }
        // 请求成功并且结果有值把结果传出去
        if (success && dict) {
            success(dict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            if (error.code == -1011) {
                [SVProgressHUD dismiss];
                [SVProgressHUD showErrorWithStatus:@"网关错误"];
            }
            if (error.code == 500){
                [SVProgressHUD dismiss];
                [SVProgressHUD showErrorWithStatus:@"找不到服务器"];
            }else if (error.code == -1009){
                [SVProgressHUD dismiss];
                [SVProgressHUD showErrorWithStatus:@"网络连接中断"];
            }
            failure(error);
        }
    }];
    
}


@end
