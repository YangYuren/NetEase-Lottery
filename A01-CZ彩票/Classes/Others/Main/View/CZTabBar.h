//
//  CZTabBar.h
//  A01-CZ彩票
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZTabBar;

@protocol CZTabBarDelegate <NSObject>

- (void)tabBarDidClickedBtn:(CZTabBar *)tabBar fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface CZTabBar : UIView
- (void)addTabBarItem:(NSString *)imgName selectedImgName:(NSString *)selectedImgName;

@property (nonatomic, weak) id<CZTabBarDelegate> delegate;
@end
