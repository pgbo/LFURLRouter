//
//  NSURL+LFURLRouteParser.h
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (LFURLRouteParser)

- (NSDictionary *)lfur_parseAsPathInfo;

- (NSDictionary *)lfur_parseAsQueryString;

@end
