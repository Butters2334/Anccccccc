//
//  JTTTextResult.m
//  JTTMagicLine
//
//  Created by Jymn_Chen on 14-9-8.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import "JTTTextResult.h"

@implementation JTTTextResult

- (instancetype)initWithRange:(NSRange)aRange string:(NSString *)aString {
    self = [super init];
    if (self) {
        _range  = aRange;
        _string = aString;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Location:%ld, Length:%ld, String:%@", _range.location, _range.length,_string];
}

@end
