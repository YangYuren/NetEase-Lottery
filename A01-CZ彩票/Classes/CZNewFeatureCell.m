//
//  CZNewFeatureCell.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZNewFeatureCell.h"
#import "CZTabBarController.h"
@interface CZNewFeatureCell()

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@end

@implementation CZNewFeatureCell
- (IBAction)clickRootView:(id)sender {
    //点击开始按钮  进入主界面
    CZTabBarController *tabBarC = [[CZTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarC;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(void)setBackImageName:(NSString *)backImageName{
    _backImageName = backImageName;
    self.backImageView.image = [UIImage imageNamed:self.backImageName];
    [self.startBtn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
}
-(void)setButtonHidden:(BOOL)hidden{
    self.startBtn.hidden = hidden;
}
@end
