//
//  CZPush2Controller.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZPush2Controller.h"
#import "CZPickerTimeView.h"
#import "CZCell.h"
@interface CZPush2Controller()<CZPickerViewDelegate>

@property(nonatomic,strong)NSIndexPath * indexPath;

@property(nonatomic,weak)UIDatePicker * datePicker;
@end

@implementation CZPush2Controller


-(void)loadGroup{
    CZItem *item = [CZItemSwitch itemWithTitle:@"推送我关注的比赛" subTitle:nil];
   
    CZGroup *group1 = [CZGroup groupWithItems:@[item] footer:@"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我"];
    CZItemLabel * time = [CZItemLabel itemWithTitle:@"起始时间"];
    time.time = @"00:00";
    CZGroup *group2 = [CZGroup groupWithItems:@[time] header:@"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我"];
    self.groups  = @[group1,group2];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建文本框
    self.indexPath = indexPath;
    UITextField * txt = [UITextField new];//间接调用文本输入框
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.contentView addSubview:txt];
    //获取当前的cell  把文本框添加进来
    UIDatePicker * datePicker = [UIDatePicker new];
    datePicker.datePickerMode = UIDatePickerModeTime;
    self.datePicker = datePicker;
    txt.inputView = datePicker;
    CZPickerTimeView  * czp = [CZPickerTimeView pickerTimeView];
    czp.delegate = self;
    txt.inputAccessoryView =czp;
    //文本框为第一响应者
    [txt becomeFirstResponder];
}
-(void)pickerTimeViewCancel:(CZPickerTimeView *)pickerTime{
    
    [self.view endEditing:YES];
    [self.tableView deselectRowAtIndexPath:self.indexPath animated:YES];
}

-(void)pickerTimeViewSure:(CZPickerTimeView *)pickerTime{
    
    
    NSDateFormatter * formate = [[NSDateFormatter alloc] init];
    formate.dateFormat = @"HH:mm";
    NSString * str = [formate stringFromDate:self.datePicker.date];
    UITableViewCell * cell =  [self.tableView cellForRowAtIndexPath:self.indexPath];
    //获取上面的标题栏    存放了一个UILabel
    UILabel* lbl =  (UILabel *)cell.accessoryView;
    lbl.text = str;
    
    //保存到偏好设置
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    
    
    
    [self.view endEditing:YES];
    [self.tableView deselectRowAtIndexPath:self.indexPath animated:YES];
}

@end
