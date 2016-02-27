//
//  MultibSelectTableViewController.m
//  ShopDemo
//
//  Created by kkk on 15/12/31.
//  Copyright © 2015年 kkk. All rights reserved.
//

#import "MultibSelectTableViewController.h"
#import "MutilbSelectTableViewCell.h"
@interface MultibSelectTableViewController ()
{
    BOOL _flag[20];
}
@end

@implementation MultibSelectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIView *view = [UIView new];
    self.tableView.tableFooterView  = view;
}




#pragma mark - UITableViewDelegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"numberOfRowsInSection");
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"cellForRowAtIndexPath");
    
    static NSString *cellIdentifier = @"multibcell";
    MutilbSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MutilbSelectTableViewCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
    }
    
    if (_flag[indexPath.row]) {
        
        [cell.seletBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    }
    else{
        
        [cell.seletBtn setImage:[UIImage imageNamed:@"Unselect"] forState:UIControlStateNormal];
    }
    
    typeof(cell) __weak weakcell = cell;
    cell.imagSelectBlcok = ^()
    {
        NSLog(@"imagSelectBlcok");
        if (!_flag[indexPath.row]) {
            NSLog(@"!_flag[indexPath.row]");
            [weakcell.seletBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
            _flag[indexPath.row] = YES;
        }
        else{
            
            [weakcell.seletBtn setImage:[UIImage imageNamed:@"Unselect"] forState:UIControlStateNormal];
           
            _flag[indexPath.row] = NO;
        }
       
    };
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"heightForRowAtIndexPath");
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
