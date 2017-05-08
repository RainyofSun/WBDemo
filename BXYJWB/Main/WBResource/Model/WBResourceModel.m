//
//  WBResourceModel.m
//  BXYJWB
//
//  Created by MS on 17/2/8.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBResourceModel.h"

@implementation WBResourceModel

+(instancetype)resourceModel:(NSDictionary *)dict{
    return [[self alloc] initResourceModel:dict];
}

-(instancetype)initResourceModel:(NSDictionary *)dict{
    if (self = [super init]) {
        self.cbirthday = dict[@"cbirthday"];
        self.cblood = dict[@"cblood"];
        self.ceducation = dict[@"ceducation"];
        self.cemail = dict[@"cemail"];
        self.cemotion = dict[@"cemotion"];
        self.cforsex = dict[@"cforsex"];
        self.chref = dict[@"chref"];
        self.cintroduce = dict[@"cintroduce"];
        self.clocation = dict[@"clocation"];
        self.cqq = dict[@"cqq"];
        self.cname = dict[@"cname"];
        self.cintroduce = dict[@"cintroduce"];
        self.crealname = dict[@"crealname"];
        self.csex = dict[@"csex"];
        self.ctag = dict[@"ctag"];
        self.cuid = dict[@"cuid"];
        self.cwork = dict[@"cwork"];
        self.dtregist = dict[@"dtregist"];
        self.isgive = dict[@"isgive"];
        self.narticle = dict[@"narticle"];
        self.nfans = dict[@"nfans"];
        self.nfollow = dict[@"nfollow"];
    }
    return self;
}

@end
