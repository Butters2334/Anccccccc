//
//  JTTTextResult.h
//  JTTMagicLine
//
//  Created by Jymn_Chen on 14-9-8.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTTTextResult : NSObject

@property (nonatomic, assign) NSRange   range;
@property (nonatomic, copy)   NSString *string;

- (instancetype)initWithRange:(NSRange)aRange string:(NSString *)aString;

@end
