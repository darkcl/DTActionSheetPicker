//
//  DTActionSheetPickerBuilder.h
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import <Foundation/Foundation.h>

#import "DTActionSheetPicker.h"

@interface DTActionSheetPickerBuilder : NSObject

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *doneButtonText;
@property (nonatomic, strong) NSString *cancelButtonText;

@property DTActionSheetPickerMode pickerMode;

@property (copy, readwrite) DTActionDoneBlock doneBlock;
@property (copy, readwrite) DTActionCancelBlock cancelBlock;

@property (nonatomic, strong) NSArray <NSDate *> *dateArray;

@property (nonatomic, strong) NSLocale *locale;

- (DTActionSheetPicker *)build;

@end
