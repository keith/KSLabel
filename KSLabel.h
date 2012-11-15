//
//  KSLabel.h
//  Test
//
//  Created by Keith Smiley on 11/14/12.
//  Copyright (c) 2012 Keith Smiley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KSLabel : NSTextField

@property (nonatomic, strong) NSString *notificationToPost;

- (id)initWithAttributedString:(NSAttributedString *)string inView:(NSView *)view;

@end
