//
//  CZMyController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/27.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZMyController.h"
#import "UIImage+Ex.h"
#import "CZHelpController.h"
#import "CZSettingController.h"
@interface CZMyController ()
@property (weak, nonatomic) IBOutlet UIButton *loginView;

@end

@implementation CZMyController
- (IBAction)ClickSet:(id)sender {
    CZSettingController * set = [[CZSettingController alloc]init];
    set.title = @"设置";
    set.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(ClickHelp)];
    [self.navigationController pushViewController:set animated:YES];
}
-(void)ClickHelp{
    CZHelpController * help = [CZHelpController alloc];
    [self.navigationController pushViewController:help animated:YES];
}

- (IBAction)loginClick:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    UIImage * backImg = [UIImage slipImage:@"RedButton"];
    [self.loginView setBackgroundImage:backImg forState:UIControlStateNormal];
    
    UIImage * backImgP = [UIImage slipImage:@"RedButtonPressed"];
    [self.loginView setBackgroundImage:backImgP forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
