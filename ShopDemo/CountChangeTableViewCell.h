//
//  CountChangeTableViewCell.h
//  ShopDemo
//
//  Created by kkk on 16/1/4.
//  Copyright © 2016年 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^subBlock)();

typedef void(^addBlock)();

@interface CountChangeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *singlePriceLb;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UILabel *countLb;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property(nonatomic,copy) subBlock subblock;
@property(nonatomic,copy) addBlock addblock;

@end
