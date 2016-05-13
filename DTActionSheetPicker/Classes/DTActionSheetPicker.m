//
//  DTActionSheetPicker.m
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import "DTActionSheetPicker.h"

#import "DTActionSheetPickerBuilder.h"
#import "DTTreeNode.h"

@interface DTActionSheetPicker() {
    NSString *titleText;
    
    NSString *doneButtonText;
    NSString *cancelButtonText;
    
    DTActionSheetPickerMode pickerMode;
    DTActionDoneBlock doneBlock;
    DTActionCancelBlock cancelBlock;
    
    NSLocale *locale;
    NSArray <NSDate *> *dateArray;
    
    NSDateFormatter *dateFormatter;
    
    DTTreeNode *dateStringTree;
}

@end

@implementation DTActionSheetPicker

+ (instancetype)showPickerWithTitle:(NSString *)title
                     datePickerMode:(DTActionSheetPickerMode)datePickerMode
                              dates:(NSArray <NSDate *> *)dates
                             origin:(UIView*)view{
    return [self
            showPickerWithBuilder:^(DTActionSheetPickerBuilder *builder) {
                builder.titleText = title;
                builder.dateArray = dates;
            }
            origin:view];
}

+ (instancetype)showPickerWithBuilder:(void(^)(DTActionSheetPickerBuilder *builder))builderBlock
                               origin:(UIView*)view{
    DTActionSheetPickerBuilder * aBuilder = [[DTActionSheetPickerBuilder alloc] init];
    builderBlock(aBuilder);
    
    DTActionSheetPicker *aDatePicker = [aBuilder build];
    
    [aDatePicker showPicker];
    
    return aDatePicker;
}

- (instancetype)initWithBuilder:(DTActionSheetPickerBuilder *)builder{
    if (self = [super init]) {
        titleText = builder.titleText;
        doneButtonText = builder.doneButtonText;
        cancelButtonText = builder.cancelButtonText;
        
        pickerMode = builder.pickerMode;
        doneBlock = builder.doneBlock;
        cancelBlock = builder.cancelBlock;
        
        dateFormatter = [[NSDateFormatter alloc] init];
        
        if (pickerMode == DTActionSheetPickerDateMode) {
            [dateFormatter setDateFormat:@"YYYY-MM-DD"];
        }else{
            [dateFormatter setDateFormat:@"HH-mm"];
        }
    }
    return self;
}

- (DTTreeNode *)treeFromDateArray:(NSArray <NSDate *> *)dates{
    DTTreeNode *aTree = [[DTTreeNode alloc] init];
    
    for (NSDate *aDate in dates) {
        
    }
    
    return aTree;
}

- (void)showPicker{
    
}

@end
