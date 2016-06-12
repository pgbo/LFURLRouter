//
//  LFURLRouteCore.m
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "LFURLRouteCore.h"
#import "LFURLRouteNodeManager.h"
#import "LFURLRouteConfigurationManager.h"

@interface LFURLRouteCore ()

@property (nonatomic, strong) LFURLRouteNodeManager *nodeManager;

@property (nonatomic, strong) LFURLRouteConfigurationManager *configurationManager;

@end

@implementation LFURLRouteCore

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nodeManager = [[LFURLRouteNodeManager alloc] init];
        self.configurationManager = [[LFURLRouteConfigurationManager alloc] init];
    }
    return self;
}

@end
