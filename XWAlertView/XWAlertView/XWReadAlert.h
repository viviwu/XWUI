//
//  XWReadAlert.h
//  XWReadAlert
//
//  Created by vivi wu on 2019/5/30.
//  Copyright © 2019 vivi wu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XWReadAlert : UIView
@property (nonatomic, assign) NSUInteger delay;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *timerBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UIButton *noBtn;

+ (void)ShowAlertWith:(NSString *)title
              message:(NSString *)msg
                delay:(NSUInteger)delay;

@end

NS_ASSUME_NONNULL_END
