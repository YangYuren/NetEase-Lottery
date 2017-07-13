//
//  CZBaseSettingController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/28.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZBaseSettingController.h"
#import "CZGroup.h"
#import "CZItem.h"
#import "CZItemSwitch.h"
#import "CZItemArrow.h"

#import "CZCell.h"

@interface CZBaseSettingController ()

@end

@implementation CZBaseSettingController

-(instancetype)init{
    if(self= [super init]){
        self = [[super init] initWithStyle:UITableViewStyleGrouped];
    }
    return  self;
}

-(NSArray *)groups{
    if(_groups==nil){
        //获取数据
        [self loadGroup];
    }
    return _groups;
}
-(void)loadGroup{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    //设置头间距与背景图片
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
    self.tableView.sectionHeaderHeight = 15;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CZGroup * group = self.groups[section];
    return group.Items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //自定义cell
    CZCell * cell = [CZCell cellWithTableView:tableView];
    CZGroup * group = self.groups[indexPath.section];
    CZItem * item = group.Items[indexPath.row];
    cell.item = item;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CZGroup * group = self.groups[indexPath.section];
    CZItem * item = group.Items[indexPath.row];
    if(item.option){
        item.option();
    }else if(item.destinationController){
        UIViewController * vc = [item.destinationController new];
        vc.title = item.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CZGroup * group = self.groups[section];
    return group.header;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CZGroup * group = self.groups[section];
    return group.footer;
}



@end
