//
//  LFURLRouteApplication.h
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LFURLRouteConfiguration.h"
#import "LFURLRouteNode.h"

@interface LFURLRouteApplication : NSObject

@property (nonatomic, readwrite) LFURLRouteConfiguration *configure;

+ (LFURLRouteApplication *)sharedInstance;

- (void)addNode:(LFURLRouteNode *)node;

- (id)routeURL:(NSURL *)URL;

- (id)routeURL:(NSURL *)URL
   otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams;

- (id)routeURL:(NSURL *)URL
   otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams
  sourceObject:(NSObject *)sourceObject;

@end

@interface LFURLRouteApplication (URLString)

- (id)routeURLString:(NSString *)URLString;

- (id)routeURLString:(NSString *)URLString
         otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams;

- (id)routeURLString:(NSString *)URLString
         otherParams:(NSDictionary<NSString *, NSObject *> *)otherParams
        sourceObject:(NSObject *)sourceObject;

@end
