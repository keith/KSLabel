//
//  KSLabel.m
//  A NSTextField subclass implementing label-like functionality
//
//  Created by Keith Smiley on 11/14/12.
//  Copyright (c) 2012 Keith Smiley. All rights reserved.
//

#import "KSLabel.h"

@implementation KSLabel

- (id)initWithAttributedString:(NSAttributedString *)string inView:(NSView *)view
{
    NSSize labelSize = string.size;
    
    NSRect labelFrame = NSMakeRect(NSMidX(view.bounds) - (labelSize.width / 2.0f),
                                   NSMidY(view.bounds) - (labelSize.height / 2.0f),
                                   ceil(labelSize.width),
                                   ceil(labelSize.height));
    
    self = [super initWithFrame:labelFrame];
    if (!self) {
        return nil;
    }

    [self setAttributedStringValue:string];
    [self setBezeled:NO];
    [self setDrawsBackground:NO];
    [self setEditable:NO];
    [self setSelectable:NO];
    [self sizeToFit];
    
    return self;
}

- (void)mouseDown:(NSEvent *)theEvent {
    if (self.notificationToPost && ![self.notificationToPost isEqualToString:@""]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:self.notificationToPost
                                                            object:nil];
    }
}

@end
