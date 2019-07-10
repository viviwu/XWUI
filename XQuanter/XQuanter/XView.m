//
//  XView.m
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "XView.h"

@implementation XView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

+ (UILabel*)newLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 5, 5)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"-----";
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:12];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.textAlignment = NSTextAlignmentLeft;
//    [self addSubview:label];

//    label.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//    label.layer.shadowOffset = CGSizeMake(-1, 1);
//    label.layer.shadowRadius = 5;
//    label.layer.shadowOpacity = 1;
//    label.layer.borderColor = [[UIColor grayColor] CGColor];//边框颜色
//    label.layer.borderWidth = 0.5;//边框的宽度
    
    return label;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
