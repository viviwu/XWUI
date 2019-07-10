//
//  XUnitLabel.h
//  XQuanter
//
//  Created by viviwu on 2019/7/10.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XView.h"
NS_ASSUME_NONNULL_BEGIN

@interface XUnitLabel : XView

@property(nonatomic, copy) NSString * title;
@property(nonatomic, copy) NSString * info;
@property(nonatomic, copy) UIColor * textColor;

@end

NS_ASSUME_NONNULL_END
