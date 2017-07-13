//
//  CZCell.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZItem;
@interface CZCell : UITableViewCell

@property(nonatomic,strong)CZItem * item;
+(instancetype)cellWithTableView:(UITableView *)tableVIew style:(UITableViewCellStyle)style;
+(instancetype)cellWithTableView:(UITableView *)tableVIew ;
@end
