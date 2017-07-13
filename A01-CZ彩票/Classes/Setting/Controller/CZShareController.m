//
//  CZShareController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZShareController.h"
#import <MessageUI/MessageUI.h>
@interface CZShareController ()<MFMessageComposeViewControllerDelegate>

@end

@implementation CZShareController

-(void)loadGroup
{
    CZItem *item11 = [CZItemArrow  itemWithTitle:@"电话分享" option:^{
//        NSURL * url = [NSURL URLWithString:@"tel://17601472402"];
//        [[UIApplication sharedApplication] openURL:url];
    }];
    CZItem *item12 = [CZItemArrow  itemWithTitle:@"短信分享" option:^{
//        NSURL * url = [NSURL URLWithString:@"sms://17601472402"];
//         [[UIApplication sharedApplication] openURL:url];
        
        __weak CZShareController *weakSelf = self;
        MFMessageComposeViewController * vc = [MFMessageComposeViewController new];
        vc.body = @"装一下吧";//短信内容
        vc.recipients = @[@"10086"];
        [weakSelf presentViewController:vc animated:YES completion:nil];
        vc.messageComposeDelegate = weakSelf;
        
    }];
    CZItem *item13 = [CZItemArrow  itemWithTitle:@"邮件分享" option:^{
//        NSURL * url = [NSURL URLWithString:@"mailto://89423913@qq.com"];
//         [[UIApplication sharedApplication] openURL:url];
        
        MFMailComposeViewController * vc = [MFMailComposeViewController new];
        [vc setSubject:@"hellow"];
        [vc setMessageBody:@"yanglaoshideyuanshi" isHTML:NO];
        [vc setToRecipients:@[@"89423913@qq.com"]];
        
        
        
        
    }];

    CZGroup *group1 = [CZGroup groupWithItems:@[item11,item12,item13] ];
    self.groups = @[group1];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
