//
//  XView.h
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kSelfW      self.bounds.size.width
#define kSelfH      self.bounds.size.height

#define kScreenW    UIScreen.mainScreen.bounds.size.width
#define kScreenH    UIScreen.mainScreen.bounds.size.height

#define kSViewW         self.view.bounds.size.width
#define kSViewH         self.view.bounds.size.height

@interface XView : UIView

+ (UILabel*)newLabel;

@end

NS_ASSUME_NONNULL_END

//for realtime market
