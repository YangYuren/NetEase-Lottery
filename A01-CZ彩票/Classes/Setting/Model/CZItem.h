//
//  CZItem.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CZItemArrowOption)() ;

@interface CZItem : NSObject
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * icon;
//记录跳转的目标控制器
@property(nonatomic,assign)Class destinationController;
@property(nonatomic,copy)NSString * subTitle;
//记录执行的方法
@property(nonatomic,copy)CZItemArrowOption option;
@property(nonatomic,copy)NSString * time;


+(instancetype)itemWithTitle:(NSString *)title;
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon subTitle:(NSString *)subTitle;

@end
