//
//  WBLoginButton.m
//  BXYJWB
//
//  Created by MS on 17/1/19.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBLoginButton.h"
#import "UIView+Frame.h"
#import "UIView+Tap.h"
#import "UIView+Animation.h"

@implementation WBLoginButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 5.0f;
        self.layer.cornerRadius = 5.0f;
        [self touvhView];
    }
    return self;
}

-(UIView *)touvhView{
    if (!_touvhView) {
        UIView* view = [[UIView alloc] init];
        view.size = CGSizeMake(64, 64);
        view.origin = CGPointMake(8, 8);
        view.layer.cornerRadius = 5.0f;
        view.backgroundColor = [UIColor whiteColor];
        [view setTapTarget:self action:@selector(touchMe:)];
        [self addSubview:view];
        _touvhView = view;
    }
    return _touvhView;
}

-(void)touchMe:(UITapGestureRecognizer*)sender{
    if ([self.delegate respondsToSelector:@selector(touchLoginView:)]) {
        [self.touvhView drainAway:1.5];
        [self.delegate touchLoginView:self];
    }
}

@end
