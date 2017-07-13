//
//  CZPush4Controller.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZPush4Controller.h"

@interface CZPush4Controller ()

@end

@implementation CZPush4Controller

-(void)loadGroup{
    CZItem *item11 = [CZItemSwitch itemWithTitle:@"定时提醒" subTitle:nil];
    
    CZGroup *group1 = [CZGroup groupWithItems:@[item11] footer:@"开启后，可设定时间提醒自己在开奖日不要忘了购彩"];
    self.groups = @[group1];
}

@end
