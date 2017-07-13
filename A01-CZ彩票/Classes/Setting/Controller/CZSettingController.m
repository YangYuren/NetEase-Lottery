//
//  CZSettingController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZSettingController.h"
#import "CZAoboutController.h"

#import "CZMorePushController.h"
#import "CZRedeemCodeController.h"
#import "CZShareController.h"

#import "CZProductController.h"
@interface CZSettingController ()
@end

@implementation CZSettingController

-(void)loadGroup{
    CZItem *item11 = [CZItemArrow itemWithTitle:@"使用兑换码" icon:@"RedeemCode" destController:[CZRedeemCodeController class]];
    CZGroup *group1 = [CZGroup groupWithItems:@[item11]];
    //第二组
    CZItem *item21 = [CZItemArrow itemWithTitle:@"推送和提醒" icon:@"MorePush" destController:[CZMorePushController class]];
    CZItem *item22 = [CZItemSwitch itemWithTitle:@"摇一摇机选" icon:@"handShake"];
    CZItem *item23 = [CZItemSwitch itemWithTitle:@"声音效果" icon:@"sound_Effect"];
    CZItem *item24 = [CZItemSwitch itemWithTitle:@"购彩小助手" icon:@"More_LotteryRecommend"];
    CZItem *item25 = [CZItemSwitch itemWithTitle:@"圈子仅Wifi加载图片" icon:@"More_QuanZi_NetFlowSwitchImage"];
    CZGroup *group2 = [CZGroup groupWithItems:@[item21,item22,item23,item24,item25]];
    
    //第三组
    CZItem *item31 = [CZItemArrow itemWithTitle:@"检查新版本" icon:@"MoreUpdate" option:^{
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提醒" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }];
    CZItem *item32 = [CZItemArrow itemWithTitle:@"推荐给朋友" icon:@"MoreShare" destController:[CZShareController class]];
    CZItem *item33 = [CZItemArrow itemWithTitle:@"产品推荐" icon:@"MoreNetease" destController:[CZProductController class]];
    CZItem *item34 = [CZItemArrow itemWithTitle:@"关于" icon:@"MoreAbout" destController:[CZAoboutController class]];
    CZGroup *group3 = [CZGroup groupWithItems:@[item31,item32,item33,item34]];
    self.groups = @[group1,group2,group3];
}


@end
