//
//  CZArenaController.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#define kCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#import "CZArenaController.h"
#import "UIView+Ex.h"
@implementation CZArenaController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    //设置导航条的背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航条的titleView
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    segment.width = 120;
    
    //设置segment的背景图片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    segment.selectedSegmentIndex = 0;
    
    //设置文字的颜色
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:kCOLOR(6, 150, 120)} forState:UIControlStateNormal];
    self.navigationItem.titleView = segment;
}
@end
