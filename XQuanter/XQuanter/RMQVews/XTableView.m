//
//  XTableView.m
//  XQuanter
//
//  Created by vivi wu on 2019/7/11.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "XTableView.h"


#pragma mark  -- XTriLabelTableViewCell

@interface XTriLabelTableViewCell ()
{
    CGFloat gap;
}
@property (nonatomic, strong) UILabel * timeLabel;

@end


@implementation XTriLabelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
        _timeLabel.textColor = UIColor.lightGrayColor;
        
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_timeLabel];
        
        gap = 5;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenW);
    
    UIColor * textColor = (arc4random()%2)>1 ? UIColor.redColor : UIColor.greenColor;
    self.textLabel.textColor = textColor;
    self.detailTextLabel.textColor = textColor;
    
    _timeLabel.font = [UIFont systemFontOfSize:12.0];
    self.textLabel.font = [UIFont systemFontOfSize:12.0];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    
    CGFloat W = kSelfW/3-gap;
    self.timeLabel.frame = CGRectMake(gap, 0, W, kSelfH);
    self.textLabel.frame = CGRectMake(gap + W, 0, W, kSelfH);
    self.detailTextLabel.frame = CGRectMake(gap+2*W, 0, W, kSelfH);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end


#pragma mark  -- XSegmentView

@interface XSegmentView : XView
{
    CGFloat fgap;
    NSUInteger SEC;
}
@end

@implementation XSegmentView

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray<NSString*>*)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        fgap = 1;
        SEC = titles.count;
        CGFloat W = kSelfW/SEC;
        
        for (int i=0; i<SEC; i++) {
            UIButton * btn = self.newButton;
            btn.frame = CGRectMake(i*W, 0, W, W);
            btn.tag = 100+i;
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setBackgroundColor:UIColor.whiteColor];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchDown];
        }
        self.backgroundColor = UIColor.groupTableViewBackgroundColor;
        self.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}

- (void)clicked:(id)sender
{
    NSLog(@"%s", __func__);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat W = kSelfW/SEC ;
    for (UIButton * btn in self.subviews) {
        NSInteger i = btn.tag-100;
        btn.frame = CGRectMake(i*W, 0, W-fgap, kSelfH);
    }
}

- (UIButton *)newButton{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(0, 0, kSelfW/2, kSelfH)];
    [btn setTitle:@"----" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [btn.titleLabel setShadowOffset: CGSizeMake(1, 1)];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return btn;
}

@end





#pragma mark  -- XTableView
#define kRCellID @"CellWithIdentifier"
@interface XTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _barH;
}
@property(nonatomic, strong) UITableView * tableView;
@property(nonatomic, strong) XSegmentView *segmentView;
@end

@implementation XTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _barH = 20;
        XSegmentView *segmentView = [[XSegmentView alloc]initWithFrame:CGRectMake(0, 0, kSelfW, _barH) titles:@[@"逐笔明细", @"成交统计"]];
        [self addSubview: segmentView];
        
        _tableView = [[UITableView alloc]initWithFrame: CGRectMake(0,_barH, kSelfW, kSelfH-_barH)
                                                 style: UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self addSubview:_tableView];
        
        [_tableView registerClass:XTriLabelTableViewCell.class forCellReuseIdentifier:kRCellID];
        [_tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        self.backgroundColor = UIColor.whiteColor;
        self.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.segmentView.frame = CGRectMake(0, 0, kSelfW, _barH);
    self.tableView.frame = CGRectMake(0,_barH, kSelfW, kSelfH-_barH);
}

#pragma  mark -UITableViewDegelates
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XTriLabelTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:kRCellID forIndexPath:indexPath];
//    if(cell==nil) {
//        cell=[[XTriLabelTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kRCellID];
//    }
    cell.timeLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"%ld", 10*(indexPath.section+1)+indexPath.row];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%ld", 10*(indexPath.section+1)+indexPath.row]; 
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
