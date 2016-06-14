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
    return [self routeURL:URL otherParams:nil sourceObject:nil];
}

- (id)routeURL:(NSURL *)URL
   otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams
{
    return [self routeURL:URL otherParams:otherParams sourceObject:nil];
}

- (id)routeURL:(NSURL *)URL
   otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams
  sourceObject:(NSObject *)sourceObject
{
    LFURLRouteNode *node = [self.core.nodeManager nodeForURL:URL];
    if (node == nil) {
        return nil;
    }
    else {
        NSDictionary *urlKeyValues = nil;
        if (self.core.configurationManager.configure.URLRouteStyle == LFURLRouteStylePathInfo) {
            urlKeyValues = [URL lfur_parseAsPathInfo];
        }
        else if (self.core.configurationManager.configure.URLRouteStyle == LFURLRouteStyleQueryString) {
            urlKeyValues = [URL lfur_parseAsQueryString];
        }
        
        NSMutableDictionary *completeParams = [NSMutableDictionary dictionary];
        
        if (urlKeyValues.count > 0) {
            [completeParams addEntriesFromDictionary:urlKeyValues];
        }
        if (otherParams.count > 0) {
            [completeParams addEntriesFromDictionary:otherParams];
        }
        
        if (node.executingBlock != nil) {
            node.executingBlock(URL, completeParams, sourceObject);
        }
        if (node.returnableBlock != nil) {
            return node.returnableBlock(URL, completeParams, sourceObject);
        }
        else {
            return nil;
        }
    }
}

- (id)routeURLString:(NSString *)URLString
{
    return [self routeURLString:URLString otherParams:nil sourceObject:nil];
}

- (id)routeURLString:(NSString *)URLString
         otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams
{
    return [self routeURLString:URLString otherParams:otherParams sourceObject:nil];
}

- (id)routeURLString:(NSString *)URLString
         otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams
        sourceObject:(NSObject *)sourceObject
{
    return [self routeURL:[NSURL URLWithString:URLString] otherParams:otherParams sourceObject:sourceObject];
}

@end
