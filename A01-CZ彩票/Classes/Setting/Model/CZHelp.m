//
//  CZHelp.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZHelp.h"

@implementation CZHelp
+(instancetype)initWithDict:(NSDictionary *)dict{
    CZHelp * help = [self new];
    [help setValuesForKeysWithDictionary:dict];
    return help;
}
@end
