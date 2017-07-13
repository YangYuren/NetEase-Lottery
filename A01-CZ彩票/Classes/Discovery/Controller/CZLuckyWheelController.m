//
//  CZLuckyWheelController.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/24.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZLuckyWheelController.h"
#import "CZWheelView.h"
#import "UIView+Ex.h"

@interface CZLuckyWheelController ()

@end

@implementation CZLuckyWheelController
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CZWheelView * czWheel = [CZWheelView wheelView];
    [self.view addSubview:czWheel];
    
    CGPoint point = CGPointMake(self.view.center.x, self.view.center.y+70);
    czWheel.center = point;
    
    
    
    
    

}


@end
