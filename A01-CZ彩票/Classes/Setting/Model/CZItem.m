//
//  CZItem.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZItem.h"

@implementation CZItem

+(instancetype)itemWithTitle:(NSString *)title{
    CZItem * item =[[self alloc] init];
    item.title = title;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon{
    CZItem * item =[[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle{
    CZItem * item =[[self alloc] init];
    item.subTitle = subTitle;
    item.title = title;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon subTitle:(NSString *)subTitle{
    CZItem * item =[[self alloc] init];
    item.title = title;
    item.subTitle = subTitle;
    item.icon = icon;
    return item;
}

@end
