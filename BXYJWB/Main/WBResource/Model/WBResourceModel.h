//
//  WBResourceModel.h
//  BXYJWB
//
//  Created by MS on 17/2/8.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBBaseModel.h"

@interface WBResourceModel : WBBaseModel

@property(nonatomic,copy)NSString* cbirthday;
@property(nonatomic,copy)NSString* cblood;
@property(nonatomic,copy)NSString* ceducation;
@property(nonatomic,copy)NSString* cemail;
@property(nonatomic,copy)NSString* cemotion;
@property(nonatomic,copy)NSString* cforsex;
@property(nonatomic,copy)NSString* chref;
@property(nonatomic,copy)NSString* cintroduce;
@property(nonatomic,copy)NSString* clocation;
@property(nonatomic,copy)NSString* cname;
@property(nonatomic,copy)NSString* cqq;
@property(nonatomic,copy)NSString* crealname;
@property(nonatomic,copy)NSString* csex;
@property(nonatomic,copy)NSString* ctag;
@property(nonatomic,copy)NSString* cuid;
@property(nonatomic,copy)NSString* cwork;
@property(nonatomic,copy)NSString* dtregist;
@property(nonatomic,copy)NSString* isgive;
@property(nonatomic,copy)NSString* narticle;
@property(nonatomic,copy)NSString* nfans;
@property(nonatomic,copy)NSString* nfollow;

+(instancetype)resourceModel:(NSDictionary*)dict;
-(instancetype)initResourceModel:(NSDictionary*)dict;
@end
