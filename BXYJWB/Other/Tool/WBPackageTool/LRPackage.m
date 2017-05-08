//
//  LRPackage.m
//  封装
//
//  Created by MS on 16-5-5.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "LRPackage.h"

@implementation LRPackage

+(UIButton*)createButtonWithFrame:(CGRect)frame andWithTitle:(NSString*)title andWithTitleColor:(UIColor*)color andWithBackGroudImage:(UIImage*)image target:(id)target action:(SEL)action{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UILabel *)createLabelWithFrame:(CGRect)frame andWithText:(NSString *)text andWithTextColor:(UIColor *)color andWithLabelTextSize:(int)size{
    UILabel* label = [[UILabel alloc]init];
    label.frame = frame;
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

+(UITextField *)createTextFiledWithFrame:(CGRect)frame andWithPlaceHoder:(NSString *)placeHoder andWithTextColor:(UIColor *)color andWithTextSize:(int)size{
    UITextField* textFiled = [[UITextField alloc]init];
    textFiled.frame = frame;
    textFiled.placeholder = placeHoder;
    textFiled.textColor = color;
    textFiled.font = [UIFont systemFontOfSize:size];
    return textFiled;
}

+(UIImageView *)createImageViewWithFrame:(CGRect)frame andWithImage:(UIImage *)image{
    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    imageView.image = image;
    return imageView;
}

+(UITableView*)createTableViewWithFrame:(CGRect)frame andWithBackGroundColor:(UIColor*)color{
    UITableView* tableView = [[UITableView alloc]init];
    tableView.frame = frame;
    tableView.backgroundColor = color;
    return tableView;
}

+(UITextView*)createTextViewWithFrame:(CGRect)frame andWithTextColor:(UIColor*)color andWithTextSize:(int)size{
    UITextView* textView = [[UITextView alloc]init];
    textView.frame = frame;
    textView.textColor = color;
    textView.font = [UIFont systemFontOfSize:size];
    return textView;
}

//需要导入系统库WebKit
+(WKWebView *)createWkWebViewWithFrame:(CGRect)frame {
    WKWebView* wkView = [[WKWebView alloc]init];
    wkView.frame = frame;
    return wkView;
}

+(UILabel*)setTitleTextWithString:(NSString *)string{
    UILabel* titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = string;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    //self.navigationItem.titleView = titleLabel;
    return titleLabel;
}

+ (UIBarButtonItem*)leftItemWithImagename:(NSString *)imagename
                                   target:(id)target
                                   action:(SEL)action {
    CGSize btnSize = [UIImage imageNamed:imagename].size;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 5, btnSize.width, btnSize.height);
    [button setBackgroundImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* left = [[UIBarButtonItem alloc]initWithCustomView:button];
    return left;
}

+(UIBarButtonItem *)rightItemWithImagename:(NSString *)imagename target:(id)target action:(SEL)action{
    CGSize btnSize = [UIImage imageNamed:imagename].size;
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(310, 5, btnSize.width, btnSize.height);
    [button setBackgroundImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* right = [[UIBarButtonItem alloc]initWithCustomView:button];
    return right;
}

+ (UIBarButtonItem*)itemWithTitle:(NSString *)title
                           target:(id)target
                           action:(SEL)action
                        tintColor:(UIColor *)tintColor {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
    item.tintColor = tintColor;
    return item;
    
}

+(UITapGestureRecognizer *)tapGentureTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    tap.numberOfTapsRequired = 1;
    return tap;
}

@end
