//
//  CZPush3Controller.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZPush3Controller.h"

@interface CZPush3Controller ()

@end

@implementation CZPush3Controller
-(void)loadGroup{
    CZItem *item11 = [CZItemSwitch itemWithTitle:@"中奖动画" subTitle:nil];
    
    CZGroup *group1 = [CZGroup groupWithItems:@[item11] footer:@"开启后，当有新中奖订单，打开应用时会显示动画提醒我。为避免显示过于频繁，高频彩不会提醒"];
    self.groups = @[group1];
}
@end
