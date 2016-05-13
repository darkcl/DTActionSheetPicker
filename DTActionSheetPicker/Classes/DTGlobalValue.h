//
//  DTGlobalValue.h
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import <Foundation/Foundation.h>

@class DTActionSheetPicker;

typedef NS_ENUM(NSInteger, DTActionSheetPickerMode) {
    DTActionSheetPickerDateMode,
    DTActionSheetPickerTimeMode,
};

typedef void(^DTActionDoneBlock)(DTActionSheetPicker *picker, NSDate *selectedDate, id origin);
typedef void(^DTActionCancelBlock)(DTActionSheetPicker *picker);

@interface DTGlobalValue : NSObject

@end
