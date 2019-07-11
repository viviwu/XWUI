//
//  XTableView.m
//  XQuanter
//
//  Created by vivi wu on 2019/7/11.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "XTableView.h"


@interface XTableView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView * tableView;

@end

@implementation XTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kSelfW, kSelfH) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self addSubview:_tableView];
    }
    return self;
}

#pragma  mark -UITableViewDegelates
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@""];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifying];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"第%ld行",indexPath.row];
    NSLog(@"adress -----%p-------第%ld行",cell,indexPath.row);
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
