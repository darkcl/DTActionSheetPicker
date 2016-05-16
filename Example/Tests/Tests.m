//
//  DTActionSheetPickerTests.m
//  DTActionSheetPickerTests
//
//  Created by Yeung Yiu Hung on 05/13/2016.
//  Copyright (c) 2016 Yeung Yiu Hung. All rights reserved.
//

@import XCTest;

#import <DTActionSheetPicker/DTActionSheetPicker.h>
#import <DTActionSheetPicker/DTActionSheetPickerBuilder.h>
#import <DTActionSheetPicker/DTTreeNode.h>

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (DTTreeNode *)addNodeWithData:(NSString *)str toNode:(DTTreeNode *)aNode{
    DTTreeNode *nextNode = [[DTTreeNode alloc] init];
    nextNode.data = str;
    [aNode addChild:nextNode];
    
    return nextNode;
}

- (void)testExample
{
    DTActionSheetPicker *sut = [DTActionSheetPicker
                                showPickerWithBuilder:^(DTActionSheetPickerBuilder *builder) {
                                    NSArray *dates = @[@"2014-10-30",
                                                       @"2014-11-30",
                                                       @"2014-12-30",
                                                       @"2014-01-10",
                                                       @"2015-10-03"
                                                       ];
                                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                                    [formatter setTimeZone:[NSTimeZone localTimeZone]];
                                    [formatter setDateFormat:@"yyyy-MM-dd"];
                                    
                                    NSMutableArray *result = [[NSMutableArray alloc] init];
                                    for (NSString *str in dates) {
                                        [result addObject:[formatter dateFromString:str]];
                                    }
                                    builder.pickerMode = DTActionSheetPickerDateMode;
                                    builder.dateArray = [NSArray arrayWithArray:result];
                                }
                                origin:nil];
    
    // Expected Result
    DTTreeNode *expected = [[DTTreeNode alloc] init];
    
    // Year
    DTTreeNode *yearNode1 = [self addNodeWithData:@"2014" toNode:expected];
    DTTreeNode *yearNode2 = [self addNodeWithData:@"2015" toNode:expected];
    
    // Month
    [self addNodeWithData:@"10" toNode:[self addNodeWithData:@"01" toNode:yearNode1]];
    [self addNodeWithData:@"30" toNode:[self addNodeWithData:@"10" toNode:yearNode1]];
    [self addNodeWithData:@"30" toNode:[self addNodeWithData:@"11" toNode:yearNode1]];
    [self addNodeWithData:@"30" toNode:[self addNodeWithData:@"12" toNode:yearNode1]];
    
    [self addNodeWithData:@"03" toNode:[self addNodeWithData:@"10" toNode:yearNode2]];
    
    XCTAssertTrue([expected isEqual:sut.dateTree]);
}

@end

