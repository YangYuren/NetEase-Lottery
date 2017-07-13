//
//  CZPush1Controller.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZPush1Controller.h"

@interface CZPush1Controller ()

@end

@implementation CZPush1Controller
-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
}

-(void)loadGroup{
    CZItemSwitch *item11 = [CZItemSwitch itemWithTitle:@"开奖推送" subTitle:@"每周二、四、日开奖"];
    CZItemSwitch *item12 = [CZItemSwitch itemWithTitle:@"比分直播推送"  subTitle:@"每周一、三、六开奖"];
    CZItemSwitch *item13 = [CZItemSwitch itemWithTitle:@"中奖动画"  subTitle:@"每周开奖 包括试机号提醒"];
    CZItemSwitch *item14 = [CZItemSwitch itemWithTitle:@"购彩提醒"  subTitle:@"每周一、三、五开奖"];
    CZItemSwitch *item15 = [CZItemSwitch itemWithTitle:@"圈子推送"  subTitle:@"每周二、五、日开奖"];
    CZItemSwitch *item16 = [CZItemSwitch itemWithTitle:@"排列三"  subTitle:@"每天开奖"];
    CZItemSwitch *item17 = [CZItemSwitch itemWithTitle:@"排列五"  subTitle:@"每天开奖"];
    
    
    CZGroup *group1 = [CZGroup groupWithItems:@[item11,item12,item13,item14,item15,item16,item17]];
    self.groups = @[group1];
}

@end
