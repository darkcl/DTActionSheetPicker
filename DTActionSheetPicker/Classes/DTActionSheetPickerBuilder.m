//
//  DTActionSheetPickerBuilder.m
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import "DTActionSheetPickerBuilder.h"

@implementation DTActionSheetPickerBuilder

- (DTActionSheetPicker *)build{
    return [[DTActionSheetPicker alloc] initWithBuilder:self];
}

- (instancetype)init{
    if (self = [super init]) {
        _titleText = @"DTDatePicker";
        _doneButtonText = @"Done";
        _cancelButtonText = @"Cancel";
    }
    
    return self;
}

@end
