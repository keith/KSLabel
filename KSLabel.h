//
//  KSLabel.h
//  A NSTextField subclass implementing label-like functionality
//
//  Created by Keith Smiley on 11/14/12.
//  Copyright (c) 2012 Keith Smiley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KSLabel : NSTextField

/**
 The name of an `NSNotification` you want the label to post every time it is clicked
 
 EX: [myLabel setNotificationToPost:labelClicked];
 **/
@property (nonatomic, strong) NSString *notificationToPost;

/**
 Init with an attributed string configured how you want the text to be displayed
 
 Pass the view you will add the label to. The label will be sized to fit
   and the frame will be setup to be centered in the view
 
 Then set a notification if you'd like and call [someView addSubview:myLabel];
 **/
- (id)initWithAttributedString:(NSAttributedString *)string inView:(NSView *)view;

@end
