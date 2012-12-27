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
    // The hight and width of the string
    NSSize labelSize = string.size;
    
    // Setup the frame to be the center of the passed view
    NSRect labelFrame = NSMakeRect(NSMidX(view.bounds) - (labelSize.width / 2.0f),
                                   NSMidY(view.bounds) - (labelSize.height / 2.0f),
                                   ceil(labelSize.width),
                                   ceil(labelSize.height));
    
    self = [super initWithFrame:labelFrame];
    if (!self) {
        return nil;
    }

    // Sets the string value and disables `NSTextField` like attributes
    [self setAttributedStringValue:string];
    [self setBezeled:NO];
    [self setDrawsBackground:NO];
    [self setEditable:NO];
    [self setSelectable:NO];
    
    // Causes the label to fit to the text, shouldn't change significantly
    [self sizeToFit];

    // Set the default cursor
    [self setCursor:[NSCursor arrowCursor]];

    return self;
}

- (void)mouseUp:(NSEvent *)theEvent
{
    // If the notification string is set post the notification on mouseUp
    if (self.notificationToPost && self.notificationToPost.length > 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:self.notificationToPost
                                                            object:nil];
    }
    else if (self.NSNotificationToPost)
    {
        [[NSNotificationCenter defaultCenter] postNotification:self.NSNotificationToPost];
    }
}

- (void)resetCursorRects
{
    [super resetCursorRects];
    [self addCursorRect:[self bounds] cursor:self.cursor];
}

@end
