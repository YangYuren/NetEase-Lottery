//
//  CZPickerTimeView.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZPickerTimeView;

@protocol CZPickerViewDelegate <NSObject>

-(void)pickerTimeViewCancel:(CZPickerTimeView *)pickerTime;

-(void)pickerTimeViewSure:(CZPickerTimeView *)pickerTime;

@end
@interface CZPickerTimeView : UIView


@property(nonatomic,strong)id<CZPickerViewDelegate> delegate;


+(instancetype)pickerTimeView;

@end
