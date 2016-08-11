//
//  GlobalDefine.h
//  VPMTFrame
//
//  Created by Nhan Nguyen on 6/18/14.
//  Copyright (c) 2014 Nhan Nguyen. All rights reserved.
//
/*******************************Network Define***************************************/
#import "AppDelegate.h"
#define NOTIFICATION_DETECT_SCREEN_SIZE @"NOTIFICATION_DETECT_SCREEN_SIZE"
#define NOTIFICATION_DETECT_MODAL_SCREEN_SIZE @"NOTIFICATION_DETECT_MODAL_SCREEN_SIZE"
#define NOTIFICATION_DETECT_AFTER_MODAL_SCREEN_SIZE @"NOTIFICATION_DETECT_AFTER_MODAL_SCREEN_SIZE"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kiPhoneRatioWidth(x) (kScreenWidth/x)
#define kiPhoneRatioHeight(x) (kScreenHeight/x)
#define trimString(str) [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
#define GAppDelegate [AppDelegate getInstance]
#define GSharedApplication [UIApplication sharedApplication]
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#pragma mark Enum

typedef NS_ENUM(NSUInteger, AllergyStatusType) {
    AllergyStatusTypeFailed = 1,
    AllergyStatusTypeOk,
    AllergyStatusTypeUnknow
};

typedef NS_ENUM(NSUInteger, AlertManagerPopupType) {
    H1_AllergyConfirmFilter = 1,
    C2_ClassNoteDetailPopup = 2,
    B1_CreateAlbumVC_Note = 3,
    B1_CreateAlbumVC_Delete = 4,
    F91_SchollScheduleVCPopup = 5

};

#define JP_DATE_TIME_FORMAT         @"yyyy年M月dd日"
#ifdef DEBUG
#   define Log(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define Log(...)
#endif

