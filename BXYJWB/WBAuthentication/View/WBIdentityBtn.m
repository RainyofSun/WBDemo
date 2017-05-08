//
//  WBIdentityBtn.m
//  BXYJWB
//
//  Created by MS on 17/1/19.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBIdentityBtn.h"

@implementation WBIdentityBtn

-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(15, 3, 55, 30);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor blackColor];
    self.imageView.frame = CGRectMake(3, 8, 10, 10);
}

@end
