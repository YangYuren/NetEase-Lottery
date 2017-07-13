//
//  CZTabBarController.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZTabBarController.h"
#import "CZTabBar.h"
#import "UIImage+Ex.h"

@interface CZTabBarController () <CZTabBarDelegate>
@property (nonatomic, weak) CZTabBar *customTabBar;

@end

@implementation CZTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //4 设置自定义tabBar
    CZTabBar *tabBar = [[CZTabBar alloc] init];
    self.customTabBar = tabBar;
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor redColor];
    tabBar.delegate = self;
    //3 加载tabBarController的子控制器
    [self addChildControllers];
    //移除tabBar中的所有子控件
    [self.tabBar.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //把自定义tabBar添加到系统的tabBar
    [self.tabBar addSubview:tabBar];

}
//tabBar的代理方法
- (void)tabBarDidClickedBtn:(CZTabBar *)tabBar fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    //设置选中的控制器
    self.selectedIndex = toIndex;
}

//3 加载tabBarController的子控制器
- (void)addChildControllers{
    NSArray *array = @[@"LotteryHall",@"Arena",@"Discovery",@"History",@"MyLottery"];
    for (NSString *sbName in array) {
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
        UINavigationController *navC = [sb instantiateInitialViewController];
        
        //往tabBarController中添加子控制器
        [self addChildViewController:navC];
        
        //4 设置tabBAr上得图片
        NSString *imgName = [NSString stringWithFormat:@"TabBar_%@_new",sbName];
        NSString *selectedImgName = [NSString stringWithFormat:@"TabBar_%@_selected_new",sbName];
   
        //每添加一个子控制器 ，就要往自定义tabBar中添加一个按钮
        [self.customTabBar addTabBarItem:imgName selectedImgName:selectedImgName];
   
        
    }
}

@end
