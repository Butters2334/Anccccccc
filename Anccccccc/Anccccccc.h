//
//  Anccccccc.h
//  Anccccccc
//
//  Created by Ancc on 14/12/17.
//  Copyright (c) 2014年 Ancc. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface Anccccccc : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end