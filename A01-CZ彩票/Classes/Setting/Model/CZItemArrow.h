//
//  CZItemArrow.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZItem.h"


@interface CZItemArrow : CZItem

+(instancetype)itemWithTitle:(NSString *)title destController:(Class)destinationController;


+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destController:(Class)destinationController;

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon option:(CZItemArrowOption)option;
+(instancetype)itemWithTitle:(NSString *)title option:(CZItemArrowOption)option;
@end
