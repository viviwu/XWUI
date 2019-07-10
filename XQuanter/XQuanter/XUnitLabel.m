//
//  XUnitLabel.m
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "XUnitLabel.h"

@interface XUnitLabel ()
{
    CGFloat gap;
}
@property UILabel * titleLabel;
@property UILabel * infoLabel;
@end

@implementation XUnitLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [XView newLabel];
        [self addSubview:_titleLabel];
        
        _infoLabel = [XView newLabel];
        [self addSubview:_infoLabel];
        _infoLabel.textAlignment = NSTextAlignmentRight;
        
        gap = 0;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(gap, 0, kSelfW*0.4-gap, kSelfH);
    _infoLabel.frame = CGRectMake(kSelfW*0.4+gap, 0, kSelfW*0.6-gap, kSelfH);
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (void)setInfo:(NSString *)info
{
    _infoLabel.text = info;
}

- (void)setTextColor:(UIColor *)textColor
{
    _infoLabel.textColor = textColor;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
