//
//  CZNavTitleButton.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZNavTitleButton.h"
#import "UIView+Ex.h"
@implementation CZNavTitleButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.x = (self.width - self.titleLabel.width - self.imageView.width - 5) / 2;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;


}

@end
