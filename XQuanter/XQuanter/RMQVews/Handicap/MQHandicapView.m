//
//  MQHandicapView.m
//  XQuanter
//
//  Created by vivi wu on 2019/7/11.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "MQHandicapView.h"




#pragma mark - XBattleBar

@interface XBattleBar ()
{
    CGFloat gap;
    CGFloat rate;
}
@property UILabel * lLabel;
@property UILabel * rLabel;
@property UIView * battleView;

@end

@implementation XBattleBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _divisor = 0.5;
        self.backgroundColor = UIColor.orangeColor;
        _battleView = [[UIView alloc]initWithFrame:CGRectMake(gap, 0, kSelfW*_divisor, kSelfH)];
        [self addSubview:_battleView];
        _battleView.backgroundColor = UIColor.blueColor;
        
        _lLabel = [XView newLabel];
        _lLabel.backgroundColor =UIColor.clearColor;
        _lLabel.textAlignment = NSTextAlignmentLeft;
        [_battleView addSubview:_lLabel];
        
        _rLabel = [XView newLabel];
        [_battleView addSubview:_rLabel];
        _rLabel.backgroundColor =UIColor.clearColor;
        _rLabel.textAlignment = NSTextAlignmentRight;
        
        gap = 0;
        rate = 0.5;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat W = kSelfW*rate-gap;
    _battleView.frame = CGRectMake(gap, 0, (kSelfW -2*gap) * _divisor, kSelfH);
    _lLabel.frame = CGRectMake(gap, 0, W, kSelfH);
    _rLabel.frame = CGRectMake(W+gap, 0, W, kSelfH);
}

- (void)setDivisor:(float)divisor
{
    if (divisor<0) {
        _divisor=0;
    }
    if (divisor>1) {
        _divisor=1;
    }
    _divisor = divisor;
    _battleView.frame = CGRectMake(0, 0, kSelfW * _divisor, kSelfH);
    _lLabel.text = [NSString stringWithFormat:@"%.2f%%", _divisor*100];
    _rLabel.text = [NSString stringWithFormat:@"%.2f%%", (1-_divisor)*100];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end


#pragma mark - XBidLabel

@interface XBidLabel ()
{
    CGFloat gap;
}
@property UILabel * turnLabel;

@property UILabel * priceLabel;
@property UILabel * valueLabel;

@end

@implementation XBidLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _turnLabel = [XView newLabel];
        _turnLabel.font = [UIFont systemFontOfSize:14];
        _turnLabel.textColor = UIColor.whiteColor;
        _turnLabel.backgroundColor = UIColor.orangeColor;
        [self addSubview:_turnLabel];
        
        _priceLabel = [XView newLabel];
        [self addSubview:_priceLabel];
        _priceLabel.backgroundColor = UIColor.clearColor;
        
        _valueLabel = [XView newLabel];
        [self addSubview:_valueLabel];
        _valueLabel.textAlignment = NSTextAlignmentRight;
        _valueLabel.backgroundColor = UIColor.clearColor;
        
        gap = 5;
        _turn = 0;
        _price = 0.00;
        _value =0;
        self.backgroundColor = UIColor.whiteColor;
        self.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat H = kSelfH - 2*gap;
    CGFloat W = (kSelfW - kSelfH)/2;
    _turnLabel.frame = CGRectMake(gap, gap, H, H);
    _priceLabel.frame = CGRectMake(kSelfH, 0, W, kSelfH);
    _valueLabel.frame = CGRectMake(kSelfH+W, 0, W, kSelfH);
}

- (void)setTurn:(int)turn
{
    _turn = turn;
    _turnLabel.text = [NSString stringWithFormat:@"%d", _turn];
}

- (void)setPrice:(float)price
{
    if (price<0) {
        _price = 0.00;
    }
    _priceLabel.text = [NSString stringWithFormat:@"%.2f", _price];
}

- (void)setValue:(float)value
{
    if (value<0) {
        _value =0;
    }
    if (_value>1000) {
        _valueLabel.text = [NSString stringWithFormat:@".2%fk", value/1000];
    }else{
        _valueLabel.text = [NSString stringWithFormat:@"%.0f", value];
    }
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end


#pragma mark - MQHandicapView

@interface MQHandicapView ()
{
    CGFloat gap;
    CGFloat barH;
    int SEC;
    int ROW;
}
@property (nonatomic, strong)  XBattleBar * battleBar;
@property(nonatomic, assign) float divisor;

@property (nonatomic, strong) NSTimer * timer;

@end

@implementation MQHandicapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _divisor = 0.5;
        barH = 25.0;
        gap = 2;
        SEC = 5;       //Level 1
        ROW = 2;
        float W = (kSelfW-gap*(ROW+1))/ROW;
        float H = kSelfH/SEC;
        for (int k=0; k<SEC; k++)
        {
            for (int i=0; i<ROW; i++)
            {
                CGRect frame = CGRectMake(i*W+gap, barH+k*H, W-gap, H);
                NSInteger tag = 100*(k+1)+i;
                XBidLabel * bidLabel = [[XBidLabel alloc]initWithFrame:frame];
                bidLabel.tag = tag;
                bidLabel.turn = k;
                bidLabel.price = tag;
                bidLabel.value = tag;
                
                if (k%2==0) {
                    bidLabel.backgroundColor = UIColor.groupTableViewBackgroundColor;
                }
                
                [self addSubview:bidLabel];
            }
        }
 
        _battleBar = [[XBattleBar alloc]initWithFrame:CGRectMake(gap, gap, kSelfW-2*gap, barH-2*gap)];
        [self addSubview: _battleBar];
        if (!_timer) {
            self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        }
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
 
    float W = (kSelfW-gap*(ROW+1))/ROW;
    float H = kSelfH/SEC;
   
    long k=0, i=0;
    for (XBidLabel * bidLabel  in self.subviews)
    {
        i = bidLabel.tag%100;
        k = (bidLabel.tag -i)/100 - 1;
        bidLabel.frame = CGRectMake(i*W+gap, barH+k*H, W-gap, H);
    }
    _battleBar.frame = CGRectMake(gap, gap, kSelfW-2*gap, barH-2*gap);
}

- (void)timerRun
{
    _battleBar.divisor = (arc4random()%100)/100.0;
}

- (void)dealloc
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
