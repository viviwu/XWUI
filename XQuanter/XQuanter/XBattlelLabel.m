//
//  XBattlelLabel.m
//  XQuanter
//
//  Created by viviwu on 2019/7/11.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "XBattlelLabel.h"

@interface XBattlelLabel()
{
    CGFloat gap;
    CGFloat rate;
}
@property UILabel * lLabel;
@property UILabel * rLabel;
@property UIView * battleView;
@end


@implementation XBattlelLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _divisor = 0.5;
        self.backgroundColor = UIColor.orangeColor;
        _battleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSelfW*_divisor, kSelfH)];
        [self addSubview:_battleView];
        _battleView.backgroundColor = UIColor.blueColor;
        
        _lLabel = [XView newLabel];
        _lLabel.backgroundColor =UIColor.clearColor;
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
    _battleView.frame = CGRectMake(0, 0, kSelfW * _divisor, kSelfH);
    _lLabel.frame = CGRectMake(gap, 0, kSelfW*rate-gap, kSelfH);
    _rLabel.frame = CGRectMake(kSelfW*rate+gap, 0, kSelfW*rate-gap, kSelfH);
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
