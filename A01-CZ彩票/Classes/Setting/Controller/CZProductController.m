//
//  CZProductController.m
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "CZProductController.h"
#import "CZProductCell.h"
#import "CZProduct.h"

@interface CZProductController ()
@property(nonatomic,strong)NSArray * products;

@end

@implementation CZProductController
-(instancetype)init{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(70, 70);
    layout.headerReferenceSize = CGSizeMake(0, 20);
    return [super initWithCollectionViewLayout:layout];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell
    
    UINib * nib = [UINib nibWithNibName:@"CZProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"ID"];
}
-(NSArray *)products{
    if(_products == nil){
        NSString * path = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        NSData * data = [NSData dataWithContentsOfFile:path];
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray * Murr = [NSMutableArray array];
        for (NSDictionary *dict  in arr) {
            CZProduct * pro = [CZProduct initWithDict:dict];
            [Murr addObject:pro];
        }
        _products = [Murr copy];
    }
    return _products;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.products.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CZProductCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    cell.product = self.products[indexPath.item];
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
