//
//  SwipeYearAndMonth.h
//  JINJERGROUP
//
//  Created by Nguyen Ba Linh on 2/19/16.
//  Copyright © 2016 Livepass. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeYearAndMonthDelegate <NSObject>

@optional
-(void)nextMonth;
-(void)previousMonth;


@end
@interface SwipeYearAndMonth : UIView

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic,strong) NSDate *tempDate;
@property int year;
@property int month;

@property (nonatomic,strong)id<SwipeYearAndMonthDelegate> delegate;
- (void)touchNext:(id)sender;
- (void)touchPre:(id)sender;
- (NSString *)getMonth;
- (NSString *)getYear;
- (NSInteger) getNumberDayInMonth;
- (NSDate*)getDateWithIndex: (NSInteger) index;

@end
