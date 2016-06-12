//
//  LFURLRouteNodeManager.m
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "LFURLRouteNodeManager.h"

@interface LFURLRouteNodeManager ()

@property (nonatomic, copy) NSArray *nodes;

@end

@implementation LFURLRouteNodeManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nodes = @[];
    }
    return self;
}

- (void)addNode:(LFURLRouteNode *)node {
    NSMutableArray *nodes = [self.nodes mutableCopy];
    [nodes addObject:node];
    self.nodes = nodes;
}

- (LFURLRouteNode *)nodeForURL:(NSURL *)URL {
    __block LFURLRouteNode *node;
    [self.nodes enumerateObjectsUsingBlock:^(LFURLRouteNode *obj, NSUInteger idx, BOOL *stop) {
        if (!obj.usePattern) {
            if (obj.scheme == nil ||
                [[obj.scheme lowercaseString] isEqualToString:[URL.scheme lowercaseString]]) {
                if ([[obj.identifier lowercaseString] isEqualToString:[URL.host lowercaseString]]) {
                    node = obj;
                    *stop = YES;
                }
            }
        }
        else {
            BOOL schemeMatch = NO;
            BOOL identifierMatch = NO;
            
            if (URL.scheme == nil) {
                schemeMatch = NO;
            }
            else if (obj.scheme != nil) {
                NSRegularExpression *schemeExpression = [[NSRegularExpression alloc]
                                                         initWithPattern:obj.scheme
                                                         options:NSRegularExpressionCaseInsensitive
                                                         error:nil];
                schemeMatch = [schemeExpression numberOfMatchesInString:URL.scheme
                                                                options:NSMatchingReportCompletion
                                                                  range:NSMakeRange(0, URL.scheme.length)];
            }
            else {
                schemeMatch = YES;
            }
            
            if (URL.host == nil) {
                identifierMatch = NO;
            }
            else if (obj.identifier != nil) {
                NSRegularExpression *identifierExpression = [[NSRegularExpression alloc]
                                                             initWithPattern:obj.identifier
                                                             options:NSRegularExpressionCaseInsensitive
                                                             error:nil];
                identifierMatch = [identifierExpression numberOfMatchesInString:URL.host
                                                                        options:NSMatchingReportCompletion
                                                                          range:NSMakeRange(0, URL.host.length)];
            }
            if (schemeMatch && identifierMatch) {
                node = obj;
                *stop = YES;
            }
        }
    }];
    return node;
}

@end
