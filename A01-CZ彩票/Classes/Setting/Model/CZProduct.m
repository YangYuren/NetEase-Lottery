//
//  CZProduct.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZProduct.h"

@implementation CZProduct

+(instancetype)initWithDict:(NSDictionary *)dict{
    CZProduct * pro = [CZProduct new];
    [pro setValuesForKeysWithDictionary:dict];
    return pro;
}
@end
