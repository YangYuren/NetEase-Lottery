//
//  CZNewFeatureCell.h
//  A01-CZ彩票
//
//  Created by Yang on 17/3/29.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZNewFeatureCell : UICollectionViewCell

@property(nonatomic,copy)NSString * backImageName;
-(void)setButtonHidden:(BOOL)hidden;
@end
