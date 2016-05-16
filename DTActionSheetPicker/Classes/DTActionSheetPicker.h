//
//  DTActionSheetPicker.h
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import <UIKit/UIKit.h>

@class DTActionSheetPickerBuilder, DTTreeNode;

typedef NS_ENUM(NSInteger, DTActionSheetPickerMode) {
    DTActionSheetPickerDateMode,
    DTActionSheetPickerTimeMode,
};



@interface DTActionSheetPicker : NSObject <UIPickerViewDelegate, UIPickerViewDataSource>

typedef void(^DTActionDoneBlock)(DTActionSheetPicker *picker, NSDate *selectedDate, id origin);
typedef void(^DTActionCancelBlock)(DTActionSheetPicker *picker);

+ (instancetype)showPickerWithTitle:(NSString *)title
                     datePickerMode:(DTActionSheetPickerMode)datePickerMode
                              dates:(NSArray <NSDate *> *)dates
                             origin:(UIView*)view;

+ (instancetype)showPickerWithBuilder:(void(^)(DTActionSheetPickerBuilder *builder))builderBlock
                               origin:(UIView*)view;

- (instancetype)initWithBuilder:(DTActionSheetPickerBuilder *)builder;

- (void)showPickerInView:(UIView *)view;

@property (nonatomic, strong) DTTreeNode *dateTree;

@end
