//
//  ViewController.m
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "ViewController.h"
#import "MQDashboard.h"
#import "XBattlelLabel.h"
@interface ViewController ()
@property (nonatomic, strong)MQDashboard * dashBoard;
@property (nonatomic, strong)XBattlelLabel * battlelLabel;
@property (nonatomic, strong) NSTimer * timer;
@end

@implementation ViewController

#define kSViewW         self.view.bounds.size.width
#define kSViewH         self.view.bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dashBoard = [[MQDashboard alloc]initWithFrame:CGRectMake(0, 100, kSViewW,200)];
    [self.view addSubview: _dashBoard];
    
    _battlelLabel = [[XBattlelLabel alloc]initWithFrame:CGRectMake(0, 500, kSViewW, 25)];
     [self.view addSubview: _battlelLabel];
    
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    // Do any additional setup after loading the view.
}

- (void)timerRun
{
    _battlelLabel.divisor = (arc4random()%100)/100.0; 
}


@end
