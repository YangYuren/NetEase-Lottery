//
//  CZNavController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/27.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZNavController.h"
#import "UIImage+Ex.h"
@interface CZNavController ()

@end

@implementation CZNavController

+(void)initialize{//该方法只执行一次
    //设置导航控制器的导航栏的背景图片
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置字体
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    //关闭导航栏的透明效果
    navBar.translucent = NO;
    
    
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    //设置所有导航栏字体的颜色
    
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]} forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //找回手势后退
    self.interactivePopGestureRecognizer.delegate = nil;
    
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //设置后退按钮的前面的间距变短  设置后退按钮
    UIBarButtonItem *fixedBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedBtn.width = -5;
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage originalImage:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    //覆盖了后退按钮，手势后退也没了
    viewController.navigationItem.leftBarButtonItems = @[fixedBtn,backBtn];
   //添加控制器时  把底下的标题栏去掉
    viewController.hidesBottomBarWhenPushed = YES;
    
    [super pushViewController:viewController animated:animated];
}
-(void)backClick{
    [self popViewControllerAnimated:YES];
}

@end
