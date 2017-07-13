//
//  CZHelp.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHelp : NSObject
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * html;
@property(nonatomic,copy)NSString * id;

+(instancetype)initWithDict:(NSDictionary *)dict;

@end
