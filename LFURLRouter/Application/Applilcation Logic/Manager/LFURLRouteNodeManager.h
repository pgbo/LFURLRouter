//
//  LFURLRouteNodeManager.h
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFURLRouteNode.h"

@interface LFURLRouteNodeManager : NSObject

- (void)addNode:(LFURLRouteNode *)node;

- (LFURLRouteNode *)nodeForURL:(NSURL *)URL;

@end
