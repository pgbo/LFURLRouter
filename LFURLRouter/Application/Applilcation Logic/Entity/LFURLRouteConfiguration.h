//
//  LFURLRouteConfiguration.h
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LFURLRouteStyle) {
    LFURLRouteStylePathInfo,
    LFURLRouteStyleQueryString
};

@interface LFURLRouteConfiguration : NSObject

/**
 *  可路由的 Scheme
 */
@property (nonatomic, copy) NSArray<NSString *> *routableSchemes;

/**
 *  路由的 URL 样式
 */
@property (nonatomic, assign) LFURLRouteStyle URLRouteStyle;

/**
 *  默认配置，默认使用 LFURLRouteStyleQueryString
 *
 *  @return
 */
+ (LFURLRouteConfiguration *)defaultConfiguration;

@end
