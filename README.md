## KSLabel

A dead simple class for when you need to create a simple label
programmatically.

## Methods

The only custom method available is

```objc
- (instancetype)initWithAttributedString:(NSAttributedString *)string
                                  inView:(NSView *)view;
```

The attributed string should be an `NSAttributedString` with whatever
attributes you want to be displayed. **Be sure to set the
`NSFontAttributeName` key**

The passed `NSView` should be the view the label will be added to. The
label will be setup to be centered within the passed view.

You can also set `notificationToPost` with the name of an
`NSNotification` to be posted when the label is clicked.

Example:

```objc
NSDictionary *attributes = @{NSFontAttributeName: [NSFont systemFontOfSize:[NSFont systemFontSize]]};
NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"My string"
                                                             attributes:attributes];
KSLabel *mylabel = [[KSLabel alloc] initWithAttributedString:string
                                                      inView:titleBarView];
mylabel.notificationToPost = @"Some String!";
NSNotification *notification = [NSNotification notificationWithName:@"someName"
                                                             object:someObject
                                                           userInfo:@{@"someKey": @"someObject"}]
myLabel.NSNotificationToPost = notification;
myLabel.action = @selector(doSomething:);
myLabel.cursor = [NSCursor pointingHandCursor];
[myView addSubview:mylabel];
```

## [CocoaPods](http://cocoapods.org/)

If you're using CocoaPods, which you should be, just add this to your
Podfile.

	pod 'KSLabel'
