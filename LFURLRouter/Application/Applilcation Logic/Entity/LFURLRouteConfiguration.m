//
//  LFURLRouteConfiguration.m
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "LFURLRouteConfiguration.h"

@implementation LFURLRouteConfiguration

+ (LFURLRouteConfiguration *)defaultConfiguration
{
    LFURLRouteConfiguration *defaultCfg = [[LFURLRouteConfiguration alloc]init];
    defaultCfg.routableSchemes = nil;
    defaultCfg.URLRouteStyle = LFURLRouteStyleQueryString;
    return defaultCfg;
}

@end
