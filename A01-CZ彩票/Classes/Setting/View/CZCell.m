//
//  CZCell.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZCell.h"
#import "CZItem.h"
#import "CZItemArrow.h"
#import "CZItemSwitch.h"
#import "CZItemLabel.h"

@interface CZCell()


@property(nonatomic,weak)UISwitch * switchView;
@property(nonatomic,weak)UILabel * lblView;
@end

@implementation CZCell

-(UISwitch *)switchView{
    if(_switchView ==nil){
        UISwitch * switchView = [[UISwitch alloc] init];
        _switchView = switchView;
        [_switchView addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        //加载状态
        //获取开关状态
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        _switchView.on = [user boolForKey:self.item.title];
    }
    return _switchView;
}
-(void)valueChanged:(UISwitch *)sender{
    //保存开关的状态  保存到偏好设置
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    
    [user setBool:sender.isOn forKey:self.item.title];
}
-(UILabel *)lblView{
    if(_lblView ==nil){
        UILabel * timeView = [[UILabel alloc] init];
        timeView.textColor = [UIColor grayColor];
        timeView.font = [UIFont systemFontOfSize:13];
        _lblView = timeView;
    }
    return _lblView;
}

//因为要创建可重用cell

+(instancetype)cellWithTableView:(UITableView *)tableVIew style:(UITableViewCellStyle)style{
    CZCell * cell = [tableVIew dequeueReusableCellWithIdentifier:@"ID"];
    if(cell == nil){
        cell = [[self alloc] initWithStyle:style reuseIdentifier:@"ID"];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    }
    return cell;
}
+(instancetype)cellWithTableView:(UITableView *)tableVIew{
    return [self cellWithTableView:tableVIew style:UITableViewCellStyleSubtitle];
}
-(void)setItem:(CZItem *)item{
    _item = item;
    self.textLabel.text = item.title;
    if(item.icon){
        self.imageView.image= [UIImage imageNamed:item.icon];
    }
    if(item.subTitle){
        self.detailTextLabel.text = item.subTitle;
    }
    if([item isKindOfClass:[CZItemArrow class]]){
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if([item isKindOfClass:[CZItemSwitch class]]){
        //开关的cell
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryView = self.switchView;
    }else if([item isKindOfClass:[CZItemLabel class]]){
        self.lblView.text = item.time;
         [self.lblView sizeToFit];
        self.accessoryView = self.lblView;
        
    }else{
        self.accessoryView = nil;
    }
}
@end
