//
//  CZPickerTimeView.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZPickerTimeView.h"

@interface CZPickerTimeView()


@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *sure;

@end

@implementation CZPickerTimeView
+(instancetype)pickerTimeView{
    return [[[NSBundle mainBundle] loadNibNamed:@"CZPickerTime" owner:nil options:nil] lastObject];;
}
- (IBAction)Cancel:(id)sender {
    if([self.delegate respondsToSelector:@selector(pickerTimeViewCancel:)]){
        [self.delegate pickerTimeViewCancel:self];
    }
    
}
- (IBAction)Sure:(id)sender {
    if([self.delegate respondsToSelector:@selector(pickerTimeViewSure:)]){
        [self.delegate pickerTimeViewSure:self];
    }
    
}

@end
