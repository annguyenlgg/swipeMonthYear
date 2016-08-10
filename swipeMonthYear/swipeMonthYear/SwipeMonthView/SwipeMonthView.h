//
//  SwipeMonthView.h
//  JINJERGROUP
//
//  Created by Nguyen Ba Linh on 12/31/15.
//  Copyright © 2015 Livepass. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeMonthViewDelegate <NSObject>

@optional
-(void)nextMonth;
-(void)previousMonth;


@end

@interface SwipeMonthView : UIView
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic,strong) NSDate *tempDate;

@property (nonatomic,strong)id<SwipeMonthViewDelegate> delegate;
- (void)touchNext:(id)sender;
- (void)touchPre:(id)sender;
- (NSString *)getMonth;
- (NSString *)getYear;
- (NSInteger) getNumberDayInMonth;
@end
