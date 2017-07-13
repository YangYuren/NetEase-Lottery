//
//  CZProductCell.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZProductCell.h"

#import "CZProduct.h"

@interface CZProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;


@end
@implementation CZProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
}
-(void)setProduct:(CZProduct *)product{
    _product = product;
    
    self.iconView.image = [UIImage imageNamed:product.icon];
    self.titleView.text = product.title;
}
@end
