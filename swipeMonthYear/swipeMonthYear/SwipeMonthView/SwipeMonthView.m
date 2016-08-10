//
//  SwipeMonthView.m
//  JINJERGROUP
//
//  Created by Nguyen Ba Linh on 12/31/15.
//  Copyright © 2015 Livepass. All rights reserved.
//

#import "SwipeMonthView.h"

@implementation SwipeMonthView
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
    [leftButton setImage:[UIImage imageNamed:@"ic_daily_back.png"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    [leftButton addTarget:self action:@selector(touchPre:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftButton];
    
    
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"ic_daily_next.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(self.frame.size.width - self.frame.size.height, 0, self.frame.size.height, self.frame.size.height);
    [rightButton addTarget:self action:@selector(touchNext:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightButton];
    
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textColor = [UIColor whiteColor];
    [self addSubview:timeLabel];
    NSDate *today = [NSDate date];
    tempDate = today;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSString *stringDay = [dateFormatter stringFromDate:today];
    timeLabel.text = [NSString stringWithFormat:@"%@月",stringDay];
    
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
    NSString *stringDay = [dateFormatter stringFromDate:preMonth];
    timeLabel.text = stringDay;
    
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
    NSString *stringDay = [dateFormatter stringFromDate:preMonth];
    timeLabel.text = stringDay;
    
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
@end
