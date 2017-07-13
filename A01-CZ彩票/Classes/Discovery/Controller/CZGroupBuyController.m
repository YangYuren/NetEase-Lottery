//
//  CZGroupBuyController.m
//  A01-CZ彩票
//  合买
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZGroupBuyController.h"
#import "UIImage+Ex.h"
#import "UIView+Ex.h"
#import "CZNavTitleButton.h"

@interface CZGroupBuyController ()
@property (nonatomic, weak) UIView *popView;
@end

@implementation CZGroupBuyController
- (void)viewDidLoad{
    [super viewDidLoad];

    //titleView 自定义按钮
    CZNavTitleButton *btn = [CZNavTitleButton buttonWithType:UIButtonTypeCustom];
    btn.adjustsImageWhenHighlighted = NO;
    
    [btn setTitle:@"全部猜中" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    //按钮的背景图片
    UIImage *backImg = [UIImage imageNamed:@"navTitleSel"];
    [btn setBackgroundImage:backImg forState:UIControlStateSelected];

    btn.width = backImg.size.width;
    btn.height = backImg.size.height;
    
    //添加点击事件
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = btn;
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = -5;
    
    UIView *itemView = [[UIView alloc] init];
    
    UIButton *textBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [textBtn setTitle:@"发合买" forState:UIControlStateNormal];
    [textBtn sizeToFit];
    
    UIButton *imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [imgBtn setImage:[UIImage imageNamed:@"NavInfoFlat"] forState:UIControlStateNormal];
    [imgBtn sizeToFit];
    [itemView addSubview:textBtn];
    [itemView addSubview:imgBtn];
    
    itemView.width = textBtn.width + imgBtn.width;
    itemView.height = 64;
    
    textBtn.x = 0;
    textBtn.y = itemView.y + 20 - 5;
    
    imgBtn.x = CGRectGetMaxX(textBtn.frame) + 5;
    imgBtn.y = textBtn.y + 5;
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:itemView];
    self.navigationItem.rightBarButtonItems = @[fixedItem,item1];
}

- (void)btnClicked:(CZNavTitleButton *)titleBtn{
    //0 设置按钮 的选中状态
    titleBtn.selected = !titleBtn.isSelected;
    //1 旋转图片
    [UIView animateWithDuration:1 animations:^{
        titleBtn.imageView.transform = CGAffineTransformRotate(titleBtn.imageView.transform, M_PI);
    }];
    
    //2 弹出层
    if (titleBtn.isSelected) {
        UIView *popView = [[UIView alloc] init];
        self.popView = popView;
        [self.view addSubview:popView];
        popView.frame = CGRectMake(0, 0, self.view.width, self.view.height * 0.5);
        popView.alpha = 0.5;
        popView.backgroundColor = [UIColor blackColor];
    }else {
        [self.popView removeFromSuperview];
    }
}

@end
