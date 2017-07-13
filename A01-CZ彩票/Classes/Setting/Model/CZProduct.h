//
//  CZProduct.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZProduct : NSObject

@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * id;
@property(nonatomic,copy)NSString * url;
@property(nonatomic,copy)NSString * icon;
@property(nonatomic,copy)NSString * customUrl;

+(instancetype)initWithDict:(NSDictionary *)dict;
@end
