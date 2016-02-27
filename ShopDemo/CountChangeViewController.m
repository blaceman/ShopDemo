//
//  CountChangeViewController.m
//  ShopDemo
//
//  Created by kkk on 16/1/4.
//  Copyright © 2016年 kkk. All rights reserved.
//

#import "CountChangeViewController.h"
#import "CountChangeTableViewCell.h"
#import "countModel.h"
@interface CountChangeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *contentTable;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLb;
@property (nonatomic,strong) NSMutableArray *priceArray;
@end

@implementation CountChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    _priceArray = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        countModel *model = [[countModel alloc]init];
        model.price = i+10;
        model.count = 1;
        [_priceArray addObject:model];
    }
    
    [self gettotalePrice];
}

-(void)gettotalePrice
{
    int totalPrice = 0;
    for (countModel *model in _priceArray) {
        totalPrice += model.count * model.price;
    }
    NSLog(@"totalPrice_____%d",totalPrice);
    self.totalPriceLb.text = [NSString stringWithFormat:@"合计：￥%d",totalPrice];
}


#pragma mark - UITableViewDelegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIdentifier = @"countChangecell";
    CountChangeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CountChangeTableViewCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    countModel *model = _priceArray[indexPath.row];
    cell.singlePriceLb.text = [NSString stringWithFormat:@"单价：￥%d",model.price];
    
    typeof(cell) __weak weakcell = cell;
    cell.subblock = ^()
    {
        NSLog(@"indexpath______%ld",indexPath.row);
        [weakcell.addBtn setTitle:@"标题" forState:UIControlStateNormal];
        if ([weakcell.countLb.text isEqualToString:@"1"]) {
            weakcell.countLb.text = @"1";
            model.count = 1;
        }
        else{
            int singecount = [weakcell.countLb.text intValue];
            singecount -= 1;
            model.count = singecount;
            [_priceArray replaceObjectAtIndex:indexPath.row withObject:model];
            weakcell.countLb.text = [NSString stringWithFormat:@"%d",singecount];
        }
        
        [self gettotalePrice];
    };
    
    
    cell.addblock = ^()
    {
        int singecount = [weakcell.countLb.text intValue];
            singecount += 1;
        model.count = singecount;
        [_priceArray replaceObjectAtIndex:indexPath.row withObject:model];
            weakcell.countLb.text = [NSString stringWithFormat:@"%d",singecount];
        
        [self gettotalePrice];
    };
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
