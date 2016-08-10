//
//  SwipeTimeView.h
//  JINJERSTAFF
//
//  Created by Nguyen Ba Linh on 12/11/15.
//  Copyright © 2015 Livepass. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeTimeViewDelegate;

@interface SwipeTimeView : UIView
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic,strong) NSDate *tempDate;
@property (nonatomic, strong) id<SwipeTimeViewDelegate>delegate;

- (void)initSwipeTime:(NSDate *)date;
@end

@protocol SwipeTimeViewDelegate <NSObject>

- (void)swipeTimeDidChange;

@end