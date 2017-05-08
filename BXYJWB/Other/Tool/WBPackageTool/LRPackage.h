//
//  LRPackage.h
//  封装
//
//  Created by MS on 16-5-5.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface LRPackage : NSObject
/**快速设置button*/
+(UIButton*)createButtonWithFrame:(CGRect)frame andWithTitle:(NSString*)title andWithTitleColor:(UIColor*)color andWithBackGroudImage:(UIImage*)image target:(id)target action:(SEL)action;
/**快速设置label*/
+(UILabel*)createLabelWithFrame:(CGRect)frame andWithText:(NSString*)text andWithTextColor:(UIColor*)color andWithLabelTextSize:(int)size;
/**快速设置textFiled*/
+(UITextField*)createTextFiledWithFrame:(CGRect)frame andWithPlaceHoder:(NSString*)placeHoder andWithTextColor:(UIColor*)color andWithTextSize:(int)size;
/**快速设置imageView*/
+(UIImageView*)createImageViewWithFrame:(CGRect)frame andWithImage:(UIImage*)image;
/**快速设置tableView*/
+(UITableView*)createTableViewWithFrame:(CGRect)frame andWithBackGroundColor:(UIColor*)color ;
/**快速设置textView*/
+(UITextView*)createTextViewWithFrame:(CGRect)frame andWithTextColor:(UIColor*)color andWithTextSize:(int)size;
/**快速设置webView*/
+(WKWebView*)createWkWebViewWithFrame:(CGRect)frame;
/**快速设置labeltitle*/
+(UILabel*)setTitleTextWithString:(NSString *)string;

/**
 *  快速创建左UIBarButtonItem对象 通过给定的图片
 */
+ (UIBarButtonItem*)leftItemWithImagename:(NSString *)imagename target:(id)target action:(SEL)action;
/**
 * 快速创建右UIBarButtonItem对象 通过给定的图片
 */
+(UIBarButtonItem*)rightItemWithImagename:(NSString *)imagename target:(id)target action:(SEL)action;
/**
 *  快速创建一个UIBarButtonItem对象 通过给定的标题和tintColor
 */
+ (UIBarButtonItem*)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor;
/**快速添加一个点击手势*/
+(UITapGestureRecognizer*)tapGentureTarget:(id)target action:(SEL)action;

@end
