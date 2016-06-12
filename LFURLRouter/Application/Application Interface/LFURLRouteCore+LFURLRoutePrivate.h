//
//  LFURLRouteCore+LFURLRoutePrivate.h
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "LFURLRouteCore.h"

#import "LFURLRouteNodeManager.h"
#import "LFURLRouteConfigurationManager.h"

@interface LFURLRouteCore (LFURLRoutePrivate)

@property (nonatomic, readonly) LFURLRouteNodeManager *nodeManager;

@property (nonatomic, readonly) LFURLRouteConfigurationManager *configurationManager;

@end
