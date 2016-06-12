//
//  LFURLRouteNode.h
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LFURLRouteNodeExecutingBlock)(NSURL *sourceURL, NSDictionary *params, NSObject *sourceObject);

typedef id(^LFURLRouteNodeReturnableBlock)(NSURL *sourceURL, NSDictionary *params, NSObject *sourceObject);

@interface LFURLRouteNode : NSObject

/**
 *  使用正则匹配
 */
@property (nonatomic, assign) BOOL usePattern;

/**
 *  xxx://yyy/ <-- xxx
 */
@property (nonatomic, copy) NSString *scheme;

/**
 *  xxx://yyy/ <-- yyy
 */
@property (nonatomic, copy) NSString *identifier;

/**
 *  路由被触发后，将执行此Block
 */
@property (nonatomic, copy) LFURLRouteNodeExecutingBlock executingBlock;

/**
 *  路由被触发后，将执行此Block，同时返回Block返回的对象
 */
@property (nonatomic, copy) LFURLRouteNodeReturnableBlock returnableBlock;

- (instancetype)initWithIdentifier:(NSString *)identifier
                    executingBlock:(LFURLRouteNodeExecutingBlock)executingBlock;

- (instancetype)initWithIdentifier:(NSString *)identifier
                            scheme:(NSString *)scheme
                        usePattern:(BOOL)usePattern
                    executingBlock:(LFURLRouteNodeExecutingBlock)executingBlock;

- (instancetype)initWithIdentifier:(NSString *)identifier
                   returnableBlock:(LFURLRouteNodeReturnableBlock)returnableBlock;

- (instancetype)initWithIdentifier:(NSString *)identifier
                            scheme:(NSString *)scheme
                        usePattern:(BOOL)usePattern
                   returnableBlock:(LFURLRouteNodeReturnableBlock)returnableBlock;

@end
