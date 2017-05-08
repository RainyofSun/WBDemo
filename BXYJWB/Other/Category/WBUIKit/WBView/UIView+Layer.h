//
//  UIView+Layer.h
//  BXYJWB
//
//  Created by MS on 17/1/15.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

-(void)setLayerConrnerRadius:(CGFloat)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor*)borderColor;
/**
 * 边角半径
 */
@property(nonatomic,assign)CGFloat layerCornerRadius;
/**
 * 边线宽度
 */
@property(nonatomic,assign)CGFloat layerBorderWidth;
/**
 * 边线颜色
 */
@property(nonatomic,assign)UIColor* layerBorderColor;

@end
