//
//  CZBaseSettingController.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZGroup.h"
#import "CZItem.h"
#import "CZItemSwitch.h"
#import "CZItemArrow.h"
#import "CZItemLabel.h"
@interface CZBaseSettingController : UITableViewController
-(void)loadGroup;
@property(nonatomic,strong)NSArray * groups;
@end
