//
//  CZGroup.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZGroup.h"

@implementation CZGroup


+(instancetype)groupWithItems:(NSArray *)Items{
    CZGroup * group = [[self alloc] init];
    group.Items=Items;
    return group;
}

+(instancetype)groupWithItems:(NSArray *)Items header:(NSString *)header footer:(NSString *)footer{
    CZGroup * group = [[self alloc] init];
    group.header = header;
    group.footer  =footer;
    group.Items=Items;
    return group;
}

+(instancetype)groupWithItems:(NSArray *)Items header:(NSString *)header{
    CZGroup * group = [[self alloc] init];
    group.header = header;
    group.Items=Items;
    return group;
}
+(instancetype)groupWithItems:(NSArray *)Items footer:(NSString *)footer{
    CZGroup * group = [[self alloc] init];
    group.footer  =footer;
    group.Items=Items;
    return group;
}
@end
