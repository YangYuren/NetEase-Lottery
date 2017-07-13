//
//  CZAoboutController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZAoboutController.h"
#import "CZCell.h"
#import "CZAboutView.h"

@interface CZAoboutController ()

@end

@implementation CZAoboutController

-(void)viewDidLoad{
    [super viewDidLoad];
    CZAboutView * ab = [CZAboutView initWithAbout];
    self.tableView.tableHeaderView = ab;
    
}

-(void)loadGroup{
    CZItem * item = [CZItemArrow itemWithTitle:@"评分支持"];
    CZItem * item1 = [CZItemArrow itemWithTitle:@"客服电话" subTitle:@"010-541888"];
    
    CZGroup * group = [CZGroup groupWithItems:@[item,item1]];
    self.groups = @[group];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //自定义cell
    CZCell * cell = [CZCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    CZGroup * group = self.groups[indexPath.section];
    CZItem * item = group.Items[indexPath.row];
    cell.item = item;
    return cell;
}
@end
