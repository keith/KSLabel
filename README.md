## KSLabel

A dead simple class for when you need to create a simple label programmatically.

-----------

## Methods

The only custom method available is

```- (id)initWithAttributedString:(NSAttributedString *)string inView:(NSView *)view;```

The attributed string should be an `NSAttributedString` with whatever attributes you want to be displayed. **Be sure to set the `NSFontAttributeName` key**

The passed `NSView` should be the view the label will be added to. The label will be setup to be centered within the passed view.

You can also set `notificationToPost` with the name of an `NSNotification` to be posted when the label is clicked.

Example:

	NSAttributedString *as = [[NSAttributedString alloc] initWithString:@"My string" attributes:@{NSFontAttributeName : [NSFont systemFontOfSize:[NSFont systemFontSize]]}];
	KSLabel *mylabel = [[KSLabel alloc] initWithAttributedString:as inView:titleBarView];
	[mylabel setNotificationToPost:SomeNotification];
	[myLabel setAction:@selector(doSomething:)];
	[myLabel setCursor:[NSCursor pointingHandCursor]];
	[myView addSubview:mylabel];

-----------

## [CocoaPods](http://cocoapods.org/)

If you're using CocoaPods, which you should be, just add this to your podspec.

	pod 'KSLabel', '~> 0.1.1'

-----------

### Issues 

Submit any issues you find through Github and I'll do what I can to fix them.
