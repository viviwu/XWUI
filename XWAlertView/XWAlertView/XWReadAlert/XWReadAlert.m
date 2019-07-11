//
//  XWReadAlert.m
//  XWReadAlert
//
//  Created by vivi wu on 2019/5/30.
//  Copyright © 2019 vivi wu. All rights reserved.
//

#import "XWReadAlert.h"

#define kScreenH UIScreen.mainScreen.bounds.size.height
#define kScreenW UIScreen.mainScreen.bounds.size.width

#define kMinR  0.1
#define kMaxR  0.75
#define kDfaultFrame CGRectMake(15, 100, kScreenW-30.0, kScreenH/2)

@interface XWReadAlert()
{
    NSTimer * timer;
}
@property (nonatomic, assign) NSUInteger delay;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *timerBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UIButton *noBtn;

@end

@implementation XWReadAlert

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self = [[UINib nibWithNibName:@"XWReadAlert" bundle:nil] instantiateWithOwner:nil options:nil].firstObject;
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"XWReadAlert" owner:self options:nil];
        [[nib objectAtIndex:0] setFrame:frame];
        self = [nib objectAtIndex:0];
        _delay=1;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.timerBtn.hidden = YES;
    
    [XWReadAlert smoothView:self borderColor:UIColor.groupTableViewBackgroundColor];
    [XWReadAlert smoothView:self.timerBtn borderColor:UIColor.lightGrayColor];
}

+ (void)smoothView:(UIView *)view
//      cornerRadius:(CGFloat)cornerRadius
       borderColor:(UIColor *)borderColor
{
    view.layer.cornerRadius = 5;
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = borderColor.CGColor;
    view.clipsToBounds = YES;
}

+ (CGSize)sizeWithString:(NSString *)str
                    font:(UIFont *)font
                 maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}

- (instancetype)initWith:(NSString *)title
                 message:(NSString *)msg
                   delay:(NSUInteger)delay
{
    self = [super initWithFrame:kDfaultFrame];
    if (self) {
        UIFont * txtFont = [UIFont systemFontOfSize:14];
        CGSize maxSize = CGSizeMake(kScreenW-50.0, MAXFLOAT);
        CGSize textSize = [XWReadAlert sizeWithString:msg font:txtFont maxSize:maxSize];
        
        CGFloat txtHeight = textSize.height;
        if (txtHeight < kScreenH*kMinR) {
            txtHeight = kScreenH*kMinR;
        }else if(txtHeight > kScreenH*kMaxR){
            txtHeight = kScreenH*kMaxR;
        }else{
        
        }
        CGRect frame = kDfaultFrame;
        frame.size.height = txtHeight+50+40+5+5;
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"XWReadAlert" owner:self options:nil];
        [[nib objectAtIndex:0] setFrame:frame];
        self = [nib objectAtIndex:0];
        
        _titleLabel.text = title;
        _textView.font = txtFont;
        _textView.text = msg;
        _delay=delay;
        NSLog(@"textSize = %@", NSStringFromCGSize(textSize));
        NSLog(@"frame == %@", NSStringFromCGRect(frame));
        NSLog(@"_textView.frame = %@", NSStringFromCGRect(_textView.frame));
    }
    return self;
}


+ (instancetype )ShowAlertWith:(NSString *)title
                        message:(NSString *)msg
                          delay:(NSUInteger)delay
{
    XWReadAlert * alertView = [[XWReadAlert alloc]initWith:title message:msg delay:delay];
    
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    alertView.center = [UIApplication sharedApplication].keyWindow.center;
    
    return alertView;
}


- (IBAction)doneAction:(id)sender {
    if (self.okBtnHander) {
        self.okBtnHander();
    }
    self.okBtn.hidden = YES;
    self.noBtn.hidden = YES;
    self.timerBtn.hidden = NO;
    self.timerBtn.enabled = NO;
    if (timer) {
        [timer invalidate];
        timer =nil;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)timerRun{
    if (_delay<1) {
        [timer invalidate];
        timer =nil;
        self.timerBtn.enabled = YES;
        [self.timerBtn setTitle:@"关闭" forState: UIControlStateNormal];
    }else{
        NSString * tips = [NSString stringWithFormat:@"请认真阅读协议(%lus)", (unsigned long)_delay];
        [self.timerBtn setTitle:tips forState:UIControlStateDisabled];
    }
    _delay--;
}

- (IBAction)timerBtnAction:(id)sender {
    if (self.timerBtnHander) {
        self.timerBtnHander();
    }
    [self removeFromSuperview];
}

- (IBAction)disapper:(id)sender {
    if (self.noBtnHander) {
        self.noBtnHander();
    }
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
