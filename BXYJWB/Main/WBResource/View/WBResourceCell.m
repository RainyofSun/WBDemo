//
//  WBResourceCell.m
//  BXYJWB
//
//  Created by MS on 17/2/8.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBResourceCell.h"
#import "WBConfig.h"
#import <Masonry.h>

@interface WBResourceCell ()
/**微博名字*/
@property(nonatomic,strong)UILabel* wb_name;
/**微博帐号*/
@property(nonatomic,strong)UILabel* wb_account;
/**微博是否被分配*/
@property(nonatomic,strong)UILabel* wb_allocation;

@end

@implementation WBResourceCell

-(void)setModel:(WBResourceModel *)model{
    if (model.cname) {
        self.wb_name.text = model.cname;
    }
    if (model.cintroduce) {
        self.wb_account.text = model.cintroduce;
    }else{
        self.wb_account.text = @"未填写";
    }
    if ([model.isgive intValue] == 0) {
        self.wb_allocation.text = @"未分配";
    }
    if ([model.isgive intValue] == 1) {
        self.wb_allocation.text = @"已分配";
    }
}

-(UILabel *)wb_name{
    if (!_wb_name) {
        UILabel* label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        _wb_name = label;
        label.textColor = BLACK;
        label.font = SETFONTSIZE(15);
    }
    return _wb_name;
}

-(UILabel *)wb_account{
    if (!_wb_account) {
        UILabel* label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        _wb_account = label;
        label.textColor = BLACK;
        label.font = SETFONTSIZE(15);
    }
    return _wb_account;
}

-(UILabel *)wb_allocation{
    if (!_wb_allocation) {
        UILabel* label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        _wb_allocation = label;
        label.textColor = BLACK;
        label.font = SETFONTSIZE(15);
    }
    return _wb_allocation;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.wb_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(VIEWWIDTH/3, 40));
        make.leading.equalTo(self.contentView.mas_leading).with.offset(8);
        make.top.equalTo(self.contentView.mas_top);
    }];
    
    [self.wb_account mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(VIEWWIDTH/3-8, 40));
        make.leading.equalTo(self.contentView.mas_leading).with.offset(VIEWWIDTH/3+8);
        make.top.equalTo(self.contentView.mas_top);
    }];
    
    [self.wb_allocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(VIEWWIDTH/3, 40));
        make.leading.equalTo(self.contentView.mas_leading).with.offset(VIEWWIDTH/3*2);
        make.top.equalTo(self.contentView.mas_top);
    }];
}

@end
