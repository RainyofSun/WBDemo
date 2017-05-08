//
//  WBModel.h
//  BXYJWB
//
//  Created by MS on 17/2/9.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBBaseModel.h"
#import "WBResourceModel.h"

@interface WBModel : WBBaseModel

@property(nonatomic,copy)NSString* allcount;
@property(nonatomic,copy)NSString* allpage;
@property(nonatomic,copy)NSString* code;
@property(nonatomic,strong)NSMutableArray* data;
@property(nonatomic,copy)NSString* give;
@property(nonatomic,copy)NSString* msg;
@property(nonatomic,copy)NSString* rows;
@property(nonatomic,copy)NSString* sucess;

@end
