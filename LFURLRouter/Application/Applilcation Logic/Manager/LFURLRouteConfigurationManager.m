//
//  LFURLRouteConfigurationManager.m
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "LFURLRouteConfigurationManager.h"

@implementation LFURLRouteConfigurationManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.configure = [LFURLRouteConfiguration defaultConfiguration];
    }
    return self;
}

@end
