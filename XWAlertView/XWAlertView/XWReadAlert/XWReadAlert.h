//
//  XWReadAlert.h
//  XWReadAlert
//
//  Created by vivi wu on 2019/5/30.
//  Copyright © 2019 vivi wu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XWActionHander)(void);
NS_ASSUME_NONNULL_BEGIN

@interface XWReadAlert : UIView


@property (nonatomic, copy) XWActionHander okBtnHander;
@property (nonatomic, copy) XWActionHander noBtnHander;
@property (nonatomic, copy) XWActionHander timerBtnHander;

+ (instancetype )ShowAlertWith:(NSString *)title
                        message:(NSString *)msg
                          delay:(NSUInteger)delay;

@end

NS_ASSUME_NONNULL_END
