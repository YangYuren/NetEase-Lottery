//
//  CZHelpController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZHelpController.h"
#import "CZHelp.h"
#import "CZHelpContentController.h"
@interface CZHelpController ()
@property(nonatomic,strong)NSArray * helps;
@property(nonatomic,strong)NSIndexPath * indexPath;

@end

@implementation CZHelpController

//1 加载json数据
-(NSArray*)helps{
    if(_helps==nil){
        NSString * path = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
        //加载json的二进制文件
        NSData * data = [NSData dataWithContentsOfFile:path];
        //解析json 成数组
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray * Mur = [NSMutableArray array];
        for (NSDictionary * dict in arr) {
            CZHelp * help = [CZHelp initWithDict:dict];
            [Mur addObject:help];
        }
        self.helps = [Mur copy];
    }
    return _helps;
}

//2 把czhelp  转为czItem数据
-(void)loadGroup{
    NSMutableArray * mur = [NSMutableArray array];
    for (CZHelp * help  in self.helps) {
        CZItem * item = [CZItemArrow itemWithTitle:help.title option:^{
            //弹出一个Content的内容  显示网页
            [self loadContetn];
        }];
        [mur addObject:item];
    }
    self.title = @"常见问题";
    CZGroup  * group = [CZGroup groupWithItems:[mur copy]];
    self.groups = @[group];
}
//家在网页
-(void)loadContetn{
    CZHelp * help = self.helps[self.indexPath.row];
    CZHelpContentController * vc = [CZHelpContentController new];
    
    vc.title =help.title;
    vc.help = help;
    
    UINavigationController * navC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(Click)];
    vc.navigationItem.leftBarButtonItem= btn;

    
    [self presentViewController:navC animated:YES completion:nil];
}
-(void)Click{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    CZGroup * group = self.groups[self.indexPath.section];
    CZItem  * item = group.Items[self.indexPath.row];
    if(item.option){
        item.option();
    }
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,0, -1)];;
}

@end
