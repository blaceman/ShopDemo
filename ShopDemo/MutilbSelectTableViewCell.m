//
//  MutilbSelectTableViewCell.m
//  ShopDemo
//
//  Created by kkk on 15/12/31.
//  Copyright © 2015年 kkk. All rights reserved.
//

#import "MutilbSelectTableViewCell.h"

@implementation MutilbSelectTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)TapImagBtnHandle:(id)sender {
    if (self.imagSelectBlcok) {
        self.imagSelectBlcok();
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
