//
//  ViewController.m
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "ViewController.h"
#import "MQDashboard.h"
#import "MQHandicapView.h"


@interface ViewController ()
@property (nonatomic, strong)MQDashboard * dashBoard;

@end

@implementation ViewController

#define kSViewW         self.view.bounds.size.width
#define kSViewH         self.view.bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dashBoard = [[MQDashboard alloc]initWithFrame:CGRectMake(0, 100, kSViewW,200)];
    [self.view addSubview: _dashBoard];
     
    MQHandicapView  * handcapView = [[MQHandicapView alloc]initWithFrame:CGRectMake(0, 300, kSViewW, 120)];
    [self.view addSubview: handcapView];
 
    
    // Do any additional setup after loading the view.
}



@end
