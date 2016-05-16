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
    
    [aDatePicker showPickerInView:view];
    
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
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }else{
            [dateFormatter setDateFormat:@"HH-mm"];
        }
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        _dateTree = [self treeFromDateArray:builder.dateArray];
    }
    return self;
}

- (DTTreeNode *)treeFromDateArray:(NSArray <NSDate *> *)dates{
    DTTreeNode *aTree = [[DTTreeNode alloc] init];
    
    NSArray <NSDate *> *orderedDate = [dates sortedArrayUsingComparator:^NSComparisonResult(NSDate *  _Nonnull obj1, NSDate *  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    for (NSDate *aDate in orderedDate) {
        NSString *dateCompo = [dateFormatter stringFromDate:aDate];
        
        NSArray *comp = [dateCompo componentsSeparatedByString:@"-"];
        
        DTTreeNode *currentNode;
        
        for (NSString *str in comp) {
            if (currentNode == nil) {
                if (![aTree nodeFromData:str]) {
                    currentNode = [[DTTreeNode alloc] init];
                    currentNode.data = str;
                    [aTree addChild:currentNode];
                }else{
                    currentNode = [aTree nodeFromData:str];
                }
            }else{
                if (![currentNode nodeFromData:str]) {
                    // Create new node
                    DTTreeNode *nextNode = [[DTTreeNode alloc] init];
                    nextNode.data = str;
                    [currentNode addChild:nextNode];
                    currentNode = nextNode;
                }else{
                    // Set current node to that node
                    currentNode = [currentNode nodeFromData:str];
                }
            }
        }
    }
    
    return aTree;
}

- (void)showPickerInView:(UIView *)view{
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 0;
}

@end
