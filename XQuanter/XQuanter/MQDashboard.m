//
//  MQDashboard.m
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "MQDashboard.h"
#import "XUnitLabel.h"

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
        gap = 10;
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
