//
//  MutilbSelectTableViewCell.h
//  ShopDemo
//
//  Created by kkk on 15/12/31.
//  Copyright © 2015年 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ImagBtnSelectBlock)();

@interface MutilbSelectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *seletBtn;

@property (nonatomic,copy) ImagBtnSelectBlock imagSelectBlcok;

@end
