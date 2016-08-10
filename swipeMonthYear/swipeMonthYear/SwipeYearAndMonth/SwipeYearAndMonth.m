//
//  SwipeYearAndMonth.m
//  JINJERGROUP
//
//  Created by Nguyen Ba Linh on 2/19/16.
//  Copyright © 2016 Livepass. All rights reserved.
//

#import "SwipeYearAndMonth.h"

@implementation SwipeYearAndMonth
@synthesize tempDate;
@synthesize timeLabel;
@synthesize leftButton;
@synthesize rightButton;


-(void)awakeFromNib {
    self.backgroundColor = UIColorFromRGB(0xeef5ff);
    CGFloat frameHeight = CGRectGetHeight(self.frame);
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"header_arrow_gray_left.png"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, frameHeight, frameHeight);
    [leftButton addTarget:self action:@selector(touchPre:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftButton];
    
    
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"header_arrow_gray_right.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(SCREEN_WIDTH - frameHeight, 0, frameHeight, frameHeight);
    [rightButton addTarget:self action:@selector(touchNext:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightButton];
    
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, frameHeight)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textColor = UIColorFromRGB(0x666666);
    timeLabel.font = [UIFont fontWithName:@"Hiragino Sans W3" size:15];
    [self addSubview:timeLabel];
    NSDate *today = [NSDate date];
    tempDate = today;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSString *stringMonth = [dateFormatter stringFromDate:today];
    
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *stringYear = [dateFormatter stringFromDate:today];
    
    timeLabel.text = [NSString stringWithFormat:@"%@年%@月",stringYear, stringMonth];
    self.year = [stringYear intValue];
    self.month = [stringMonth intValue];
}

- (void)touchPre:(id)sender {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ) fromDate:[[NSDate alloc] init]];
    
    [components setMonth:-1];
    [components setYear:0];
    [components setDay:0];
    NSDate *preMonth = [cal dateByAddingComponents:components toDate: tempDate options:0];
    tempDate = preMonth;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSString *stringMonth = [dateFormatter stringFromDate:preMonth];
    
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *stringYear = [dateFormatter stringFromDate:preMonth];
    
    
    NSString *stringDay = [NSString stringWithFormat:@"%@年%@月",stringYear, stringMonth];
    timeLabel.text = stringDay;
    self.year = [stringYear intValue];
    self.month = [stringMonth intValue];
    
    if ([stringDay isEqualToString:@"01"]) {
        timeLabel.text = NSLocalizedString(@"January", nil);
    } else if ([stringDay isEqualToString:@"02"]) {
        timeLabel.text = NSLocalizedString(@"February", nil);
    } else if ([stringDay isEqualToString:@"03"]) {
        timeLabel.text = NSLocalizedString(@"March", nil);
    } else if ([stringDay isEqualToString:@"04"]) {
        timeLabel.text = NSLocalizedString(@"April", nil);
    } else if ([stringDay isEqualToString:@"05"]) {
        timeLabel.text = NSLocalizedString(@"May", nil);
    } else if ([stringDay isEqualToString:@"06"]) {
        timeLabel.text = NSLocalizedString(@"June", nil);
    } else if ([stringDay isEqualToString:@"07"]) {
        timeLabel.text = NSLocalizedString(@"July", nil);
    } else if ([stringDay isEqualToString:@"08"]) {
        timeLabel.text = NSLocalizedString(@"August", nil);
    } else if ([stringDay isEqualToString:@"09"]) {
        timeLabel.text = NSLocalizedString(@"September", nil);
    } else if ([stringDay isEqualToString:@"10"]) {
        timeLabel.text = NSLocalizedString(@"October", nil);
    } else if ([stringDay isEqualToString:@"11"]) {
        timeLabel.text = NSLocalizedString(@"November", nil);
    } else if ([stringDay isEqualToString:@"12"]) {
        timeLabel.text = NSLocalizedString(@"December", nil);
    } else {
        
    }
    
    if ([self.delegate respondsToSelector:@selector(previousMonth)]) {
        [self.delegate previousMonth];
    }
    
}

- (void)touchNext:(id)sender {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ) fromDate:[[NSDate alloc] init]];
    
    [components setMonth:1];
    [components setYear:0];
    [components setDay:0];
    NSDate *preMonth = [cal dateByAddingComponents:components toDate: tempDate options:0];
    tempDate = preMonth;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSString *stringMonth = [dateFormatter stringFromDate:preMonth];
    
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *stringYear = [dateFormatter stringFromDate:preMonth];
    
    
    NSString *stringDay = [NSString stringWithFormat:@"%@年%@月",stringYear, stringMonth];
    timeLabel.text = stringDay;
    self.year = [stringYear intValue];
    self.month = [stringMonth intValue];
    
    if ([stringDay isEqualToString:@"01"]) {
        timeLabel.text = NSLocalizedString(@"January", nil);
    } else if ([stringDay isEqualToString:@"02"]) {
        timeLabel.text = NSLocalizedString(@"February", nil);
    } else if ([stringDay isEqualToString:@"03"]) {
        timeLabel.text = NSLocalizedString(@"March", nil);
    } else if ([stringDay isEqualToString:@"04"]) {
        timeLabel.text = NSLocalizedString(@"April", nil);
    } else if ([stringDay isEqualToString:@"05"]) {
        timeLabel.text = NSLocalizedString(@"May", nil);
    } else if ([stringDay isEqualToString:@"06"]) {
        timeLabel.text = NSLocalizedString(@"June", nil);
    } else if ([stringDay isEqualToString:@"07"]) {
        timeLabel.text = NSLocalizedString(@"July", nil);
    } else if ([stringDay isEqualToString:@"08"]) {
        timeLabel.text = NSLocalizedString(@"August", nil);
    } else if ([stringDay isEqualToString:@"09"]) {
        timeLabel.text = NSLocalizedString(@"September", nil);
    } else if ([stringDay isEqualToString:@"10"]) {
        timeLabel.text = NSLocalizedString(@"October", nil);
    } else if ([stringDay isEqualToString:@"11"]) {
        timeLabel.text = NSLocalizedString(@"November", nil);
    } else if ([stringDay isEqualToString:@"12"]) {
        timeLabel.text = NSLocalizedString(@"December", nil);
    } else {
        
    }
    
    if ([self.delegate respondsToSelector:@selector(nextMonth)]) {
        [self.delegate nextMonth];
    }
}

-(NSString *)getMonth {
    NSString *strMonth;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    strMonth = [dateFormatter stringFromDate: tempDate];
    return strMonth;
}

-(NSString *)getYear {
    NSString *strYear;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY"];
    strYear = [dateFormatter stringFromDate: tempDate];
    return strYear;
}

-(NSInteger) getNumberDayInMonth {
    NSInteger days = [[self getMonth]integerValue];
    NSInteger year = [[self getYear] integerValue];
    switch (days) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
            break;
            
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        case 2:
            if (year % 4 == 0) {
                return 29;
            } else {
                return 28;
            }
        default:
            return 30;
            break;
    }
}

- (NSDate*)getDateWithIndex: (NSInteger) index{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ) fromDate:tempDate];
    [components setDay:index];
    return [calendar dateFromComponents:components];
}

@end
