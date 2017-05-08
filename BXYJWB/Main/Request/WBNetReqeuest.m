//
//  WBNetReqeuest.m
//  BXYJWB
//
//  Created by MS on 17/2/7.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBNetReqeuest.h"
#import "WBIntroduceFile.h"
#import "WBModel.h"
#import "WBResourceModel.h"
#import <MJRefresh.h>

static WBNetReqeuest* request = nil;
@implementation WBNetReqeuest

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!request) {
            request = [[WBNetReqeuest alloc] init];
        }
    });
    return request;
}

-(void)WB_ReqeustResourceWithParams:(NSDictionary *)params sucess:(void (^)(id))sucess{
    NSString* soapBody = [NSString stringWithFormat:@
                          "<token>AAAAAAAAAAAA</token>"
                          "<start>0</start>"
                          "<gived>0</gived>"
                          "<nogive>1</nogive>"];
    [[LRXML shareLrXml] SOAPData:USER_READ_URL soapBody:soapBody methodName:GET_RESOURCE_MT nameSpace:USER_READ_NS success:^(id responseObject) {
        NSMutableArray* dataArray = [NSMutableArray array];
        WBModel* totaMmodel = [WBModel modelWithDictionary:responseObject];
        for (WBResourceModel* model in totaMmodel.data) {
            [dataArray addObject:model];
        }
        sucess(dataArray);
    } failure:^(NSError *error) {
        if (error) PRINTEF(error.localizedDescription);
    }];
}

@end
