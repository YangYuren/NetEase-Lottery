//
//  CZWheelView.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/27.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZWheelView.h"
#import "CZWheelButton.h"
#define kCOUNT  12

@interface CZWheelView()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property(nonatomic,weak)CADisplayLink * link;
@property (weak, nonatomic) IBOutlet UIImageView *wheelView;
@property(weak,nonatomic)UIButton * preBtn;
@end

@implementation CZWheelView
- (IBAction)clickStart:(id)sender {
    
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.toValue=@(M_PI*2*5);
    anim.delegate = self;
    anim.duration = 3;
    [self.wheelView.layer addAnimation:anim forKey:@""];
    
    
}
-(void)animationDidStart:(CAAnimation *)anim{
    self.userInteractionEnabled = NO;
    self.link.paused = YES;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.userInteractionEnabled = YES;
    self.wheelView.transform = CGAffineTransformMakeRotation(-self.preBtn.tag*2*M_PI/kCOUNT);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.link.paused = NO;
    });
    
}
+(instancetype)wheelView{
    return [[[NSBundle mainBundle] loadNibNamed:@"CZWheel" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib{
    //开始自转
    [self rotate];
    int count = 12;
    self.wheelView.userInteractionEnabled = YES;
    
    UIImage * img = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage * imgSel = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    CGFloat width = img.size.width/count * [UIScreen mainScreen].scale;//像素乘以1X或者2X
    CGFloat height  = img.size.height * [UIScreen mainScreen].scale;

    for(int i=0;i<count;i++){
        
        CZWheelButton  * btn = [CZWheelButton wheelButtonWithWidth:width/[UIScreen mainScreen].scale height:height/[UIScreen mainScreen].scale];
        
        //剪裁图片
        CGImageRef cgImg= CGImageCreateWithImageInRect(img.CGImage, CGRectMake(i*width, 0, width, height));
        
        CGImageRef cgImgSel = CGImageCreateWithImageInRect(imgSel.CGImage, CGRectMake(i*width, 0, width, height));
        
        [btn setImage:[UIImage imageWithCGImage:cgImg] forState:UIControlStateNormal];
        [btn setImage: [UIImage imageWithCGImage:cgImgSel] forState:UIControlStateSelected];
        
        CGImageRelease(cgImg);
        CGImageRelease(cgImgSel);
        
        [self.wheelView addSubview:btn];
        
        UIImage * backImg= [UIImage imageNamed:@"LuckyRototeSelected"];
        [btn setBackgroundImage:backImg forState:UIControlStateSelected];
        btn.bounds = CGRectMake(0, 0, backImg.size.width, backImg.size.height);
        
        btn.layer.anchorPoint= CGPointMake(0.5, 1);
        btn.center = self.wheelView.center;
        
        btn.transform = CGAffineTransformMakeRotation(i*2*M_PI/count);
        btn.tag = i;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        if(i==0){
            [self btnClick:btn];
        }
    }
    [super awakeFromNib];
}
//未加载开始旋转
-(void)rotate{
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotateView)];
    self.link = link;
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}
//真正旋转
-(void)rotateView{
    self.wheelView.transform = CGAffineTransformRotate(self.wheelView.transform, M_PI_4/60);
}

-(void)btnClick:(UIButton *)sender{
    self.preBtn.selected = NO;
    sender.selected =YES;
    self.preBtn = sender;
}

@end
