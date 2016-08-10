//
//  SwipeTimeView.m
//  JINJERSTAFF
//
//  Created by Nguyen Ba Linh on 12/11/15.
//  Copyright © 2015 Livepass. All rights reserved.
//

#import "SwipeTimeView.h"
#import "GlobalDefine.h"

@implementation SwipeTimeView

@synthesize tempDate;
@synthesize timeLabel;
@synthesize leftButton;
@synthesize rightButton;


-(instancetype)init {
    return [[NSBundle mainBundle]loadNibNamed:@"SwipeTimeView" owner:self options:nil][0];
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"SwipeTimeView" owner:self options:nil];
    return array[0];
}

-(void)awakeFromNib {
    self.backgroundColor = UIColorFromRGB(0xeef5ff);
    
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"header_arrow_gray_left.png"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    [leftButton addTarget:self action:@selector(touchPre:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftButton];
    
    
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"header_arrow_gray_right.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(SCREEN_WIDTH - self.frame.size.height, 0, self.frame.size.height, self.frame.size.height);
    [rightButton addTarget:self action:@selector(touchNext:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightButton];
    
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textColor = UIColorFromRGB(0x666666);
    timeLabel.font = [UIFont fontWithName:@"Hiragino Sans W3" size:15];
    [self addSubview:timeLabel];
    
    NSDate *today = [NSDate date];
    tempDate = today;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:JP_DATE_TIME_FORMAT];
    NSString *stringDay = [dateFormatter stringFromDate:today];
    timeLabel.text = stringDay;
}

- (void)initSwipeTime:(NSDate *)date{
    
    NSDate *today = [NSDate date];
    if (date == nil) {
        tempDate = today;
    }else{
        tempDate = date;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:JP_DATE_TIME_FORMAT];
    NSString *stringDay = [dateFormatter stringFromDate:tempDate];
    timeLabel.text = stringDay;
}

- (IBAction)touchPre:(id)sender {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:tempDate];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: tempDate options:0];
    tempDate = yesterday;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:JP_DATE_TIME_FORMAT];
    NSString *stringDay = [dateFormatter stringFromDate:yesterday];
    timeLabel.text = stringDay;
    if ([self.delegate respondsToSelector:@selector(swipeTimeDidChange)]) {
        [self.delegate swipeTimeDidChange];
    }
}

- (IBAction)touchNext:(id)sender {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:tempDate];
    
    [components setHour:+24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *nextday = [cal dateByAddingComponents:components toDate: tempDate options:0];
    tempDate = nextday;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:JP_DATE_TIME_FORMAT];
    NSString *stringDay = [dateFormatter stringFromDate:nextday];
    timeLabel.text = stringDay;
    if ([self.delegate respondsToSelector:@selector(swipeTimeDidChange)]) {
        [self.delegate swipeTimeDidChange];
    }
}

@end
