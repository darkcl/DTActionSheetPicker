//
//  DTActionSheetPicker.h
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import <UIKit/UIKit.h>

@class DTActionSheetPickerBuilder;

@interface DTActionSheetPicker : NSObject <UIPickerViewDelegate, UIPickerViewDataSource>

+ (instancetype)showPickerWithTitle:(NSString *)title
                     datePickerMode:(DTActionSheetPickerMode)datePickerMode
                              dates:(NSArray <NSDate *> *)dates
                             origin:(UIView*)view;

+ (instancetype)showPickerWithBuilder:(void(^)(DTActionSheetPickerBuilder *builder))builderBlock
                               origin:(UIView*)view;

- (instancetype)initWithBuilder:(DTActionSheetPickerBuilder *)builder;

- (void)showPicker;

@end
