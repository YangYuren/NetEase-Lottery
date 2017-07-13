//
//  CZWheelButton.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/27.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZWheelButton.h"


@interface CZWheelButton()

@property(nonatomic,assign)CGFloat  width;
@property(nonatomic,assign)CGFloat  height;

@end
@implementation CZWheelButton
-(void)setHighlighted:(BOOL)highlighted{
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat x= (contentRect.size.width - self.width)*0.5;
    return CGRectMake(x, 20, self.width, self.height);
}


+(instancetype)wheelButtonWithWidth :(CGFloat)width height:(CGFloat)height{
    CZWheelButton * btn = [[self alloc] init];
    btn.width = width;
    btn.height  = height;
    
    return btn;
}
@end
