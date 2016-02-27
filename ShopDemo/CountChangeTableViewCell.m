//
//  CountChangeTableViewCell.m
//  ShopDemo
//
//  Created by kkk on 16/1/4.
//  Copyright © 2016年 kkk. All rights reserved.
//

#import "CountChangeTableViewCell.h"

@implementation CountChangeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
//减
- (IBAction)TapsubHandle:(id)sender {
    if (self.subblock) {
        self.subblock();
    }
}

//加
- (IBAction)TapAddHandle:(id)sender {
    if (self.addblock) {
        self.addblock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
