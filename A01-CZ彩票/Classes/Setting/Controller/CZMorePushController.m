//
//  CZMorePushController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZMorePushController.h"
#import "CZPush1Controller.h"
#import "CZPush2Controller.h"
#import "CZPush3Controller.h"
#import "CZPush4Controller.h"
#import "CZPush5Controller.h"
@interface CZMorePushController ()

@end

@implementation CZMorePushController


-(void)loadGroup{
    CZItem *item31 = [CZItemArrow itemWithTitle:@"开奖推送" destController:[CZPush1Controller class]];
    CZItem *item32 = [CZItemArrow itemWithTitle:@"比分直播推送" destController:[CZPush2Controller class]];
    CZItem *item33 = [CZItemArrow itemWithTitle:@"中奖动画" destController:[CZPush3Controller class]];
    CZItem *item34 = [CZItemArrow itemWithTitle:@"购彩提醒" destController:[CZPush4Controller class]];
    CZItem *item35 = [CZItemArrow itemWithTitle:@"圈子推送" destController:[CZPush5Controller class]];
    CZGroup *group1 = [CZGroup groupWithItems:@[item31,item32,item33,item34,item35]];
    self.groups = @[group1];
}

@end
