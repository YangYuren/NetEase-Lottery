//
//  CZAboutView.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZAboutView.h"

@implementation CZAboutView
+(instancetype)initWithAbout{
    return [[[NSBundle mainBundle] loadNibNamed:@"CZaboutView" owner:nil options:nil] lastObject];
}
@end
