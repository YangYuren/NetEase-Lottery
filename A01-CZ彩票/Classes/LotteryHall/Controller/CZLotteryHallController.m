//
//  CZLotteryHallController.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZLotteryHallController.h"
#import "UIView+Ex.h"
@interface CZLotteryHallController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;

@property (nonatomic, weak) UIView *coverView;
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation CZLotteryHallController
//点击活动按钮，弹出广告
- (IBAction)huodong:(id)sender {
    //1 创建遮盖层
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    
    UIView *coverView = [[UIView alloc] initWithFrame:window.bounds];
    [window addSubview:coverView];
    self.coverView = coverView;
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    
    //2 创建图片
    UIImage *img = [UIImage imageNamed:@"aa"];
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    imageView.image = img;
    
    [imageView sizeToFit];
    imageView.center = self.view.center;
    
    imageView.y -= 64;
    [window addSubview:imageView];
    //允许imageView和用户交互
    imageView.userInteractionEnabled = YES;
    //3 关闭按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    [btn sizeToFit];
    
    btn.x = imageView.width - btn.width;
    btn.y = 0;
    [btn addTarget:self action:@selector(btnClose) forControlEvents:UIControlEventTouchUpInside];
    
}

//关闭遮盖层
- (void)btnClose{
    
    [UIView animateWithDuration:1 animations:^{
        self.coverView.alpha = 0;
        self.imageView.frame = CGRectMake(40, 50, 0, 0);
        [self.imageView.subviews[0] setBounds:CGRectMake(0, 0, 0, 0)];
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        [self.imageView removeFromSuperview];
    }];
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

@end
