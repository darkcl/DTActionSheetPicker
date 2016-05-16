//
//  DTTreeNode.m
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import "DTTreeNode.h"

@implementation DTTreeNode

- (void)addChild:(DTTreeNode *)aNode{
    if (![self nodeFromData:aNode.data]) {
        NSMutableArray *anArray;
        if (_children != nil) {
            anArray = [[NSMutableArray alloc] initWithArray:_children];
        }else{
            anArray = [[NSMutableArray alloc] init];
        }
        
        aNode.parent = self;
        [anArray addObject:aNode];
        _children = [NSArray arrayWithArray:anArray];
    }
}

- (DTTreeNode *)nodeFromData:(NSString *)str{
    for (DTTreeNode *aNode in _children) {
        if ([aNode.data isEqualToString:str]) {
            return aNode;
        }
    }
    return nil;
}

- (BOOL)isEqual:(DTTreeNode *)other{
    BOOL result = YES;
    
    if (![_children isEqualToArray:other.children] && (_children != nil && other.children != nil)) {
        NSLog(@"Children not equal");
        
        result = NO;
    }
    
    if (![_data isEqualToString:other.data]&& (_data != nil && other.data != nil)) {
        NSLog(@"data not equal");
        
        result = NO;
    }
    
    return (result);
}

@end
