//
//  KSLabel.m
//  A NSTextField subclass implementing label-like functionality
//

#import "KSLabel.h"

@implementation KSLabel

- (instancetype)initWithAttributedString:(NSAttributedString *)string
                                  inView:(NSView *)view
{
    // The hight and width of the string
    NSSize labelSize = string.size;

    // Setup the frame to be the center of the passed view
    NSRect labelFrame = NSMakeRect(NSMidX(view.bounds) - (labelSize.width / 2.0f),
                                   NSMidY(view.bounds) - (labelSize.height / 2.0f),
                                   ceil(labelSize.width),
                                   ceil(labelSize.height));

    self = [super initWithFrame:labelFrame];
    if (!self) return nil;

    // Sets the string value and disables `NSTextField` like attributes
    self.attributedStringValue = string;
    self.bezeled = NO;
    self.drawsBackground = NO;
    self.editable = NO;
    self.selectable = NO;

    // Causes the label to fit to the text, shouldn't change significantly
    [self sizeToFit];

    // Set the default cursor
    self.cursor = [NSCursor arrowCursor];

    return self;
}

- (void)mouseUp:(NSEvent *)theEvent
{
    // If the notification string is set post the notification on mouseUp
    if (self.NSNotificationToPost) {
        [[NSNotificationCenter defaultCenter] postNotification:self.NSNotificationToPost];
    } else if (self.notificationToPost) {
        [[NSNotificationCenter defaultCenter] postNotificationName:self.notificationToPost
                                                            object:nil];
    }
}

- (void)setNotificationToPost:(NSString *)notificationToPost
{
    NSAssert(notificationToPost.length > 0,
             @"KSLabel: Notification must have text");
    _notificationToPost = notificationToPost;
}

- (void)resetCursorRects
{
    [super resetCursorRects];
    [self addCursorRect:self.bounds cursor:self.cursor];
}

@end
