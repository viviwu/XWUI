//
//  MQDetialTableViewController.m
//  XQuanter
//
//  Created by vivi wu on 2019/7/11.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "MQDetialTableViewController.h"
#import "MQDashboard.h"
#import "MQHandicapView.h"

@interface MQDetialTableViewController ()
{
    CGFloat _boardH;
    CGFloat _chartH;
    CGFloat _capH;
    CGFloat _gap;
}
@property (nonatomic, strong)MQDashboard * dashBoard;

@end

@implementation MQDetialTableViewController

#define kScreenW    UIScreen.mainScreen.bounds.size.width
#define kScreenH    UIScreen.mainScreen.bounds.size.height

#define kSViewW         self.view.bounds.size.width
#define kSViewH         self.view.bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    _gap = 10;
    _boardH = 200;
    _chartH = 200;
    _capH = 110;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableHeaderView = self.getTableHeaderView;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

- (UIView *)getTableHeaderView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, _boardH+_chartH+_capH+3*_gap)];
    view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    _dashBoard = [[MQDashboard alloc]initWithFrame:CGRectMake(0, 0, kScreenW, _boardH)];
    [view addSubview: _dashBoard];
    
    UIView * chatView = [[UIView alloc]initWithFrame:CGRectMake(0, _boardH+_gap, kScreenW, _chartH)];
    chatView.backgroundColor = UIColor.whiteColor;
    [view addSubview: chatView];
    
    MQHandicapView  * handcapView = [[MQHandicapView alloc]initWithFrame:CGRectMake(0, _boardH+_chartH+2*_gap, kScreenW, _capH)];
    [view addSubview: handcapView];
    
    return view;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
