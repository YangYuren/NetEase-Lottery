//
//  CZDiscoveryController.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZDiscoveryController.h"

@implementation CZDiscoveryController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    //如果tableView分组的话，默认第一个cell和顶部会有间距
    //去掉这个间距
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
    
}
@end
