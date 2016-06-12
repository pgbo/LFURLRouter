//
//  LFURLRouteNode.m
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "LFURLRouteNode.h"

@implementation LFURLRouteNode

- (instancetype)initWithIdentifier:(NSString *)identifier
                    executingBlock:(LFURLRouteNodeExecutingBlock)executingBlock {
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.executingBlock = executingBlock;
    }
    return self;
}

- (instancetype)initWithIdentifier:(NSString *)identifier
                            scheme:(NSString *)scheme
                        usePattern:(BOOL)usePattern
                    executingBlock:(LFURLRouteNodeExecutingBlock)executingBlock {
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.scheme = scheme;
        self.usePattern = usePattern;
        self.executingBlock = executingBlock;
    }
    return self;
}

- (instancetype)initWithIdentifier:(NSString *)identifier
                   returnableBlock:(LFURLRouteNodeReturnableBlock)returnableBlock {
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.returnableBlock = returnableBlock;
    }
    return self;
}

- (instancetype)initWithIdentifier:(NSString *)identifier
                            scheme:(NSString *)scheme
                        usePattern:(BOOL)usePattern
                   returnableBlock:(LFURLRouteNodeReturnableBlock)returnableBlock {
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.scheme = scheme;
        self.usePattern = usePattern;
        self.returnableBlock = returnableBlock;
    }
    return self;
}

@end
