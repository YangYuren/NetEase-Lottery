//
//  CZTabBar.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZTabBar.h"
#import "CZTabBarButton.h"
@interface CZTabBar ()
@property (nonatomic, weak) UIButton *preButton;
@end

@implementation CZTabBar
//添加自定义TabBar中的按钮
- (void)addTabBarItem:(NSString *)imgName selectedImgName:(NSString *)selectedImgName{
    CZTabBarButton *btn = [CZTabBarButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
    //设置按钮的大小和内容一样
    [btn sizeToFit];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.subviews.count == 1) {
        [self btnClick:btn];
    }
    
}

- (void)btnClick:(UIButton *)sender{
    self.preButton.selected = NO;
    sender.selected = YES;
    
    //合适的时机，向代理对象发送消息
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedBtn:fromIndex:toIndex:)]) {
        [self.delegate tabBarDidClickedBtn:self fromIndex:self.preButton.tag toIndex:sender.tag];
    }
    
    self.preButton = sender;

}
//布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        //通过锚点 把center设置为左上角
        btn.layer.anchorPoint = CGPointMake(0, 0);
        btn.center = CGPointMake(i * btn.frame.size.width, 0);
        btn.tag = i;
    }
    
}
@end
