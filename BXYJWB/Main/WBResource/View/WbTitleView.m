//
//  WbTitleView.m
//  BXYJWB
//
//  Created by MS on 17/1/19.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WbTitleView.h"
#import "WBConfig.h"

@implementation WbTitleView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //设置渐变色
        CAGradientLayer* gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = frame;
        [self.layer addSublayer:gradientLayer];
        gradientLayer.colors = @[(__bridge id)WHITE.CGColor,(__bridge id)LIGHTGRAY.CGColor];
        //设置颜色变化点 取值范围是0.0～1.0
        gradientLayer.locations = @[@(0.1f),@(1.0f)];
        gradientLayer.startPoint = CGPointMake(0, 1);
        gradientLayer.endPoint = CGPointMake(1, 1);
        [self consumerCount];
    }
    return self;
}

-(UILabel *)consumerCount{
    if (!_consumerCount) {
        _consumerCount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)/3*2, 3, CGRectGetWidth(self.bounds)/3, 30)];
        _consumerCount.textColor = [UIColor lightGrayColor];
        _consumerCount.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_consumerCount];
    }
    return _consumerCount;
}

@end
