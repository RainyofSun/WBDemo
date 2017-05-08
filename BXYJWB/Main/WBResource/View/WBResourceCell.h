//
//  WBResourceCell.h
//  BXYJWB
//
//  Created by MS on 17/2/8.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBTableViewCell.h"
#import "WBResourceModel.h"

@interface WBResourceCell : WBTableViewCell

/**设置数据*/
@property(nonatomic,strong)WBResourceModel* model;
@end
