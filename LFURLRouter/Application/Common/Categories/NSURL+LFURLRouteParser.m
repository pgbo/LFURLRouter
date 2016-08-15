//
//  NSURL+LFURLRouteParser.m
//  LFURLRouter
//
//  Created by guangbool on 16/6/3.
//  Copyright © 2016年 guangbool. All rights reserved.
//

#import "NSURL+LFURLRouteParser.h"

@implementation NSURL (LFURLRouteParser)

- (NSDictionary *)lfur_parseAsPathInfo {
    if ([self path].length) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        __block NSString *keyString;
        __block NSString *valueString;
        NSArray *components = [[[self path] substringFromIndex:1] componentsSeparatedByString:@"/"];
        [components enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (idx % 2 == 0) {
                keyString = obj;
            }
            else if (idx % 2 == 1) {
                valueString = obj;
            }
            if (keyString != nil && valueString != nil) {
                [result setObject:valueString
                           forKey:keyString];
                keyString = valueString = nil;
            }
        }];
        return [result copy];
    }
    return nil;
}

- (NSDictionary *)lfur_parseAsQueryString {
    if ([self query].length) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        NSString *pattern = @"([^=]+)=(.*?)&";
        NSRegularExpression *expression = [[NSRegularExpression alloc] initWithPattern:pattern
                                                                               options:kNilOptions
                                                                                 error:nil];
        NSString *query = [[self query] stringByAppendingString:@"&"];
        NSArray *matches = [expression matchesInString:query
                                               options:NSMatchingReportCompletion
                                                 range:NSMakeRange(0, [query length])];
        [matches enumerateObjectsUsingBlock:^(NSTextCheckingResult *obj, NSUInteger idx, BOOL *stop) {
            if ([obj numberOfRanges] >= 3) {
                [result setObject:[query substringWithRange:[obj rangeAtIndex:2]]
                           forKey:[query substringWithRange:[obj rangeAtIndex:1]]];
            }
        }];
        return result;
    }
    return nil;
}

@end
