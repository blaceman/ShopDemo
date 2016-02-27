//
//  SingleSelectTableViewController.m
//  ShopDemo
//
//  Created by kkk on 16/1/4.
//  Copyright © 2016年 kkk. All rights reserved.
//

#import "SingleSelectTableViewController.h"
#import "MutilbSelectTableViewCell.h"
@interface SingleSelectTableViewController ()

@property (nonatomic,assign) NSInteger index;

@end

@implementation SingleSelectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - UITableViewDelegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIdentifier = @"multibcell";
    MutilbSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MutilbSelectTableViewCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
    }
    
    if (_index == indexPath.row) {
        [cell.seletBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    }
    else
    {
         [cell.seletBtn setImage:[UIImage imageNamed:@"Unselect"] forState:UIControlStateNormal];
    }
    
    typeof(cell) __weak weakcell = cell;

    typeof(self) __weak weakself = self;

    
    cell.imagSelectBlcok = ^()
    {
        weakself.index = indexPath.row;
        
    };
    
    
        
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
    
}


-(void)setIndex:(NSInteger)index
{
    if (_index != index) {
       
        NSLog(@"frontindex_______%ld  backindex______%ld",_index,index);
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:index inSection:0];
        MutilbSelectTableViewCell *indexcell = [self.tableView cellForRowAtIndexPath:indexpath];
        [indexcell.seletBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
        
        
        NSIndexPath *indexpath2 = [NSIndexPath indexPathForRow:_index inSection:0];
        MutilbSelectTableViewCell *indexcell2 = [self.tableView cellForRowAtIndexPath:indexpath2];
        [indexcell2.seletBtn setImage:[UIImage imageNamed:@"Unselect"] forState:UIControlStateNormal];
        

        
        _index = index;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
