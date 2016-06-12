//
//  LFURLRouteApplication.m
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "LFURLRouteApplication.h"
#import "LFURLRouteCore.h"
#import "LFURLRouteCore+LFURLRoutePrivate.h"
#import "NSURL+LFURLRouteParser.h"

@interface LFURLRouteApplication ()

@property (nonatomic, strong) LFURLRouteCore *core;

@end

@implementation LFURLRouteApplication

+ (LFURLRouteApplication *)sharedInstance {
    static LFURLRouteApplication *application;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        application = [[LFURLRouteApplication alloc] init];
    });
    return application;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.core = [[LFURLRouteCore alloc] init];
    }
    return self;
}

- (void)setConfigure:(LFURLRouteConfiguration *)configure {
    [self.core.configurationManager setConfigure:configure];
}

- (LFURLRouteConfiguration *)configure {
    return self.core.configurationManager.configure;
}

- (void)addNode:(LFURLRouteNode *)node {
    [self.core.nodeManager addNode:node];
}

- (id)routeURL:(NSURL *)URL
{
    return [self routeURL:URL sourceObject:nil];
}

- (id)routeURL:(NSURL *)URL sourceObject:(NSObject *)sourceObject
{
    LFURLRouteNode *node = [self.core.nodeManager nodeForURL:URL];
    if (node == nil) {
        return nil;
    }
    else {
        if (self.core.configurationManager.configure.URLRouteStyle == LFURLRouteStylePathInfo) {
            if (node.executingBlock != nil) {
                node.executingBlock(URL, [URL lfur_parseAsPathInfo], sourceObject);
            }
            if (node.returnableBlock != nil) {
                return node.returnableBlock(URL, [URL lfur_parseAsPathInfo], sourceObject);
            }
            else {
                return nil;
            }
        }
        else if (self.core.configurationManager.configure.URLRouteStyle == LFURLRouteStyleQueryString) {
            if (node.executingBlock != nil) {
                node.executingBlock(URL, [URL lfur_parseAsQueryString], sourceObject);
            }
            if (node.returnableBlock != nil) {
                return node.returnableBlock(URL, [URL lfur_parseAsQueryString], sourceObject);
            }
            else {
                return nil;
            }
        }
        else {
            return nil;
        }
    }
}

@end
