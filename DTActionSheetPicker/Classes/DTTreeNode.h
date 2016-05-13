//
//  DTTreeNode.h
//  Pods
//
//  Created by Yeung Yiu Hung on 13/5/2016.
//
//

#import <Foundation/Foundation.h>

@interface DTTreeNode : NSObject

@property (nonatomic, strong) NSArray <DTTreeNode *> *children;

@property (nonatomic, strong) NSString *data;

@property (nonatomic, strong) DTTreeNode *parent;

- (void)addChild:(DTTreeNode *)aNode;

- (DTTreeNode *)nodeFromData:(NSString *)str;

@end
