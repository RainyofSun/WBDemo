//
//  WBLoginButton.h
//  BXYJWB
//
//  Created by MS on 17/1/19.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WBLoginButtonDelegate <NSObject>

/**点击登录的view*/
-(void)touchLoginView:(id)sender;

@end

@interface WBLoginButton : UIButton

@property(nonatomic,strong)UIView* touvhView;
@property(nonatomic,weak)id<WBLoginButtonDelegate> delegate;

@end
