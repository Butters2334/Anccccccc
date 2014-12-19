//
//  JTTKeyboardEventSender.h
//  JTTMagicLine
//
//  Created by Jymn_Chen on 14-9-8.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

@interface JTTKeyboardEventSender : NSObject

- (void)beginKeyBoradEvents;

- (void)sendKeyCode:(NSInteger)keyCode;

- (void)sendKeyCode:(NSInteger)keyCode withModifierCommand:(BOOL)command
                alt:(BOOL)alt
              shift:(BOOL)shift
            control:(BOOL)control;

- (void)sendKeyCode:(NSInteger)keyCode withModifier:(NSInteger)modifierMask;

- (void)endKeyBoradEvents;

@end
