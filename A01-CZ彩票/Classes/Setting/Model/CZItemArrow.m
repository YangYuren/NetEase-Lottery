//
//  CZItemArrow.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZItemArrow.h"

@implementation CZItemArrow
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destController:(Class)destinationController{
    CZItemArrow * item = [super itemWithTitle:title icon:icon];
    item.destinationController = destinationController;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon option:(CZItemArrowOption)option{
    CZItemArrow * item = [super itemWithTitle:title icon:icon];
    item.option  = option;
    return item;
}

+(instancetype)itemWithTitle:(NSString *)title destController:(Class)destinationController{
    CZItemArrow * item = [super itemWithTitle:title];
    item.destinationController = destinationController;
    return item;
}


+(instancetype)itemWithTitle:(NSString *)title option:(CZItemArrowOption)option{
    CZItemArrow * item = [super itemWithTitle:title];
    item.option = option;
    return item;
}
@end
