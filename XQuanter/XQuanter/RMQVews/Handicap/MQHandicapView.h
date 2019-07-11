//
//  MQHandicapView.h
//  XQuanter
//
//  Created by vivi wu on 2019/7/11.
//  Copyright © 2019 viviwu. All rights reserved.
//

#import "XView.h"



NS_ASSUME_NONNULL_BEGIN

#pragma mark - XBattleBar 
@interface XBattleBar : XView
@property(nonatomic, assign) float divisor;
@end


#pragma mark - XBidLabel
@interface XBidLabel : XView

@property(nonatomic, assign) int turn;
@property(nonatomic, assign) float price;
@property(nonatomic, assign) float value;

@end


#pragma mark - MQHandicapView
@interface MQHandicapView : XView

@end

NS_ASSUME_NONNULL_END
