//
//  ASSTAppDelegate.m
//  AquaSpaceSuperviewTest
//
//  Created by Tim Ekl on 05.04.2013.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import "ASSTAppDelegate.h"

#define CONSTRAIN_USING_SUPERVIEW_PLACEHOLDER 0

@implementation ASSTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSButton *button = [[NSButton alloc] initWithFrame:NSZeroRect];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.title = @"Button";
    button.bezelStyle = NSRoundedBezelStyle;
    [self.window.contentView addSubview:button];
    
    id contentView = self.window.contentView;
    NSDictionary *views = NSDictionaryOfVariableBindings(contentView, button);
    
#if CONSTRAIN_USING_SUPERVIEW_PLACEHOLDER
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]" options:0 metrics:nil views:views]];
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button]" options:0 metrics:nil views:views]];
#else
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[contentView]-[button]" options:0 metrics:nil views:views]];
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contentView]-[button]" options:0 metrics:nil views:views]];
#endif
}

@end
