//
//  NSTextView+JTTTextGetter.h
//  JTTMagicLine
//
//  Created by Jymn_Chen on 14-9-8.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class JTTTextResult;

@interface NSTextView (JTTTextGetter)

- (NSInteger)jtt_currentCurseLocation;

- (JTTTextResult *)jtt_textResultOfCurrentLine;

@end
