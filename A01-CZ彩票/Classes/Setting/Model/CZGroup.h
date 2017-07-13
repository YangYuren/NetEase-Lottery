//
//  CZGroup.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZItem.h"

@interface CZGroup : NSObject
@property(nonatomic,strong)NSArray * Items;

@property(nonatomic,copy)NSString * header;
@property(nonatomic,copy)NSString * footer;

+(instancetype)groupWithItems:(NSArray *)Items;

+(instancetype)groupWithItems:(NSArray *)Items header:(NSString *)header footer:(NSString *)footer;
+(instancetype)groupWithItems:(NSArray *)Items header:(NSString *)header;
+(instancetype)groupWithItems:(NSArray *)Items footer:(NSString *)footer;
@end
