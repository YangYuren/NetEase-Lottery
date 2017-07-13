//
//  CZLuckyController.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/24.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZLuckyController.h"
@interface CZLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CZLuckyController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    
    //实现图片动画切换
    UIImage *img1 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *img2 = [UIImage imageNamed:@"lucky_entry_light1"];

    self.imageView.animationImages = @[img1,img2];
    self.imageView.animationDuration = 0.5;
    [self.imageView startAnimating];
}

@end
