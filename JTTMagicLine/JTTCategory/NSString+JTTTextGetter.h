//
//  NSString+JTTTextGetter.h
//  JTTMagicLine
//
//  Created by Jymn_Chen on 14-9-8.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JTTTextResult;

@interface NSString (JTTTextGetter)

- (JTTTextResult *)jtt_textResultOfCurrentLineCurrentLocation:(NSInteger)location;

@end
