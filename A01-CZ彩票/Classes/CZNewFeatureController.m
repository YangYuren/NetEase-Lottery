//
//  CZNewFeatureController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZNewFeatureController.h"
#import "CZNewFeatureCell.h"
#import "UIView+Ex.h"

#define kCOUNT 4
@interface CZNewFeatureController ()

@property(nonatomic,weak)UIImageView * guideView;
@property(nonatomic,weak)UIImageView * guideLargeView;
@property(nonatomic,weak)UIImageView * guideSmallView;


@property(nonatomic,assign)NSInteger index;
@end

@implementation CZNewFeatureController

-(instancetype)init{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    
    
    return [super initWithCollectionViewLayout:layout];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    UINib * nib = [UINib nibWithNibName:@"CZNewFeatureCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"ID"];
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //设置分页
    self.collectionView.pagingEnabled =YES;
    //禁止使用弹簧效果
    self.collectionView.bounces = NO;
    
    // 滚动的图片
    [self LoadImageView];
    
    //line图片
    self.index = 1;
}
-(void)LoadImageView{
    //线图片
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"guideLine"];
    [imageView sizeToFit];
    imageView.x= -200;
    [self.collectionView addSubview:imageView];
    //参与滚得的图片
    
    UIImageView * guideView = [[UIImageView alloc] init];
     guideView.image = [UIImage imageNamed:@"guide1"];
    self.guideView = guideView;
    [self.collectionView addSubview:guideView];
    [guideView sizeToFit];
    
    UIImageView * guideLargeView = [[UIImageView alloc] init];
     guideLargeView.image = [UIImage imageNamed:@"guideLargeText1"];
    self.guideLargeView = guideLargeView;
    [self.collectionView addSubview:guideLargeView];
    guideLargeView.x= 37;
    guideLargeView.y = self.view.height*0.7;
    [guideLargeView sizeToFit];
    
    UIImageView * guideSmallView = [[UIImageView alloc] init];
     guideSmallView.image = [UIImage imageNamed:@"guideSmallText1"];
    self.guideSmallView = guideSmallView;
    [self.collectionView addSubview:guideSmallView];
     guideSmallView.x= 37;
     guideSmallView.y = self.view.height*0.8;
    [guideSmallView sizeToFit];
}
//滚动停止的时候
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat width = self.collectionView.width;
    
    if(offsetX<self.guideView.x){
        width = -width;
        self.index--;
    }else{
        self.index++;
    }
    self.guideLargeView.x = offsetX+width;
    self.guideSmallView.x = offsetX+width;
    self.guideView.x = offsetX+width;
    //
    [UIView animateWithDuration:0.25 animations:^{
        self.guideLargeView.x = offsetX;
        self.guideSmallView.x = offsetX;
        self.guideView.x = offsetX;
    }];
    self.guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%zd",self.index]];
    self.guideLargeView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%zd",self.index]];
    self.guideSmallView.image = [UIImage imageNamed:[ NSString stringWithFormat:@"guideSmallText%zd",self.index]];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return kCOUNT;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZNewFeatureCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    
    NSString * imagename = [NSString stringWithFormat:@"guide%zdBackground",indexPath.item+1];
    cell.backImageName = imagename;
    
    if(indexPath.item == kCOUNT-1){
        [cell setButtonHidden:NO];
    }else{
        [cell setButtonHidden:YES ];
    }
    return cell;
}
@end
