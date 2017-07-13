//
//  CZHelpContentController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZHelpContentController.h"
#import "CZHelp.h"
@interface CZHelpContentController ()<UIWebViewDelegate>

@property(nonatomic,weak)UIWebView * webView;
@end

@implementation CZHelpContentController
-(void)loadView{
    UIWebView * webView = [[UIWebView alloc] init];
    webView.frame = [UIScreen mainScreen].bounds;
    self.view = webView;
    self.webView = webView;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    //加载网页
    NSString * path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",_help.html] ofType:nil];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:path];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    
    self.webView.delegate = self;
    
    
    //等待网页执行完成
    [self.webView loadRequest:request];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //后面是javascript代码
    if(self.help.id){
        [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.location.href='#%@'",_help.id]];
    }
}



@end
