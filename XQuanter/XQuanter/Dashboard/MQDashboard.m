//
//  MQDashboard.m
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "MQDashboard.h"
  
#pragma mark --XUnitLabel
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
        self.backgroundColor = UIColor.whiteColor;
        self.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat W = kSelfW/3-gap;
    _titleLabel.frame = CGRectMake(gap, 0, W, kSelfH);
    _infoLabel.frame = CGRectMake(W+gap, 0, 2*W, kSelfH);
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


#pragma mark --MQDashboard
@interface MQDashboard ()
{
    CGFloat gap;
}
@end

@implementation MQDashboard

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        gap = 5;
        int SEC = 10;
        float W = (kSelfW-gap)/3;
        float H = kSelfH/SEC;
        for (int k=0; k<SEC; k++)
        {
            for (int i=0; i<3; i++)
            {
                CGRect frame = CGRectMake(i*W+gap, k*H, W-gap, H);
                NSInteger tag = 100*(k+1)+i;
                if (0==i && (0==k || 1==k)) {
                    UILabel * lable = [[UILabel alloc]initWithFrame:frame];
                    lable.textAlignment = NSTextAlignmentCenter;
                    lable.tag = tag;
                    lable.text = [NSString stringWithFormat:@"%ld000", (long)tag];
                    [self addSubview:lable];
                    if (0==k) {
                        lable.font = [UIFont systemFontOfSize:20];
                    }else{
                        lable.font = [UIFont systemFontOfSize:10];
                    }
                    if (k%2==0) {
                        lable.textColor = UIColor.redColor;
                    }else
                        lable.textColor = UIColor.greenColor;
                }else{
                    XUnitLabel * unitLabel = [[XUnitLabel alloc]initWithFrame:frame];
                    unitLabel.tag = tag;
                    unitLabel.info = [NSString stringWithFormat:@"%ld000", (long)tag];
                    [self addSubview:unitLabel];
                    if (k%2==0) {
                        unitLabel.textColor = UIColor.redColor;
                    }else
                        unitLabel.textColor = UIColor.greenColor;
                }
            }
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    int SEC = 10;
    float W = (kSelfW-gap)/3;
    float H = kSelfH/SEC;
    
    long k=0, i=0;
    for (XUnitLabel * unitLabel  in self.subviews) {
        i = unitLabel.tag%100;
        k = (unitLabel.tag -i)/100 - 1;
        unitLabel.frame = CGRectMake(i*W+gap, k*H, W-gap, H);
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
