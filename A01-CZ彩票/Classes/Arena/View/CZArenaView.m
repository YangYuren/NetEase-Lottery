//
//  CZArenaView.m
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZArenaView.h"

@implementation CZArenaView

- (void)drawRect:(CGRect)rect{
    [[UIImage imageNamed:@"NLArenaBackground"] drawInRect:rect];
}
@end
