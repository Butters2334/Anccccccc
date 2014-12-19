//
//  NSString+JTTTextGetter.m
//  JTTMagicLine
//
//  Created by Jymn_Chen on 14-9-8.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import "NSString+JTTTextGetter.h"
#import "JTTTextResult.h"

@implementation NSString (JTTTextGetter)

/* 获取当前鼠标光标所在行的文字，结果以JTTTextResult形式返回 */
- (JTTTextResult *)jtt_textResultOfCurrentLineCurrentLocation:(NSInteger)location {
    NSInteger curseLocation = location;
    NSRange range = NSMakeRange(0, curseLocation);
    NSRange thisLineRange = [self rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet] options:NSBackwardsSearch range:range];
    
    NSString *line = nil;
    if (thisLineRange.location != NSNotFound) {
        NSRange lineRange = NSMakeRange(thisLineRange.location + 1, curseLocation - thisLineRange.location - 1);
        if (lineRange.location < [self length] && NSMaxRange(lineRange) < [self length]) {
            line = [self substringWithRange:lineRange];
            return [[JTTTextResult alloc] initWithRange:lineRange string:line];
        }
    }
    
    return nil;
}

@end
