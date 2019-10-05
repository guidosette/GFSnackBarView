//
//  SnackBarView.m
//  // Fanfa
//
//  Created by Guido Fanfani on 05/10/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import "GFSnackBarView.h"

const int heightView = 120;
const float animationDuration = 0.3;
const float hideDelay = 2.0;


@interface GFSnackBarView ()

@property CGRect screenRect;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;

@property (assign) bool isShow;
@property (assign) bool isLoading;
@property (assign) bool permanent;
@property (copy) void (^buttonDoneCallback)(void);
@property (copy) void (^buttonCancelCallback)(void);

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonCancelConstraintX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonDoneConstraintX;

@end

@implementation GFSnackBarView

+ (instancetype)privateInstance {
	static dispatch_once_t once;
	static GFSnackBarView *privateInstance;
	dispatch_once(&once, ^{
		privateInstance = [[self alloc] init];
	});
	return privateInstance;
}

- (id)init {
	self = [super init];
	if (self) {
		_isShow = false;
		
		self = [[NSBundle bundleForClass:self.classForCoder] loadNibNamed:@"GFSnackBarView.bundle/GFSnackBarView" owner:self options:nil][0];
		
		self.backgroundColor = [UIColor colorWithWhite:0.2
												 alpha:0.9];
		
		// Get the size of the entire screen
		_screenRect = [[UIScreen mainScreen] bounds];
		self.frame = CGRectMake(0, _screenRect.size.height, _screenRect.size.width, heightView); //over bottom (hide)
		
		//        _message = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), heightView)];
		_message.textColor=[UIColor whiteColor];
		// [self addSubview:_message];
		
		UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap)];
		[self addGestureRecognizer:singleTap];
		
		UITapGestureRecognizer *tapButtonDone = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapButtonDone)];
		[_buttonDone addGestureRecognizer:tapButtonDone];
		
		UITapGestureRecognizer *tapButtonCancel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapButtonCancel)];
		[_buttonCancel addGestureRecognizer:tapButtonCancel];
		
		UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
		[self addToCurrentRoot:keyWindow];
		
	}
	return self;
}

- (void)addToCurrentRoot:(UIView*)rootView {
	[rootView addSubview:self];
}

- (void)handleTap {
	[self hide];
}

- (void)handleTapButtonDone {
	if (_buttonDoneCallback != nil) {
		_buttonDoneCallback();
	}
	_buttonDoneCallback = nil;
	[self hide];
}

- (void)handleTapButtonCancel {
	if (_buttonCancelCallback != nil) {
		_buttonCancelCallback();
	}
	_buttonCancelCallback = nil;
	[self hide];
}

- (void)setConstraintWithError:(bool)withErrorLabel withLoading:(bool)withLoading {
	if (withErrorLabel) {
		//no loading, error
		[_loading stopAnimating];
		_isLoading = false;
		_title.hidden = false;
	} else if (!withLoading) {
		//no loading, no error
		[_loading stopAnimating];
		_isLoading = false;
		_title.text = @"";
		_title.hidden = true;
	} else {
		//loading, no error
		_isLoading = true;
		_title.text = @"";
		_title.hidden = true;
		[_loading startAnimating];
	}
}

+ (void)updateRootView:(UIView*)rootView {
	GFSnackBarView *view = [GFSnackBarView privateInstance];
	[view addToCurrentRoot:rootView];
}

+ (void)showWithMessage:(NSString*)message {
	[GFSnackBarView showGeneralWithMessage:message error:false withTitleError:nil withLoading:false buttonDoneLabel:nil buttonDoneCallback:nil buttonCancelLabel:nil buttonCancelCallback:nil permanent:false];
}

+ (void)showWithMessage:(NSString*)message permanent:(bool)permanent {
	[GFSnackBarView showGeneralWithMessage:message error:false withTitleError:nil withLoading:false buttonDoneLabel:nil buttonDoneCallback:nil buttonCancelLabel:nil buttonCancelCallback:nil permanent:permanent];
}

+ (void)showMessageWithLoading:(NSString*)message {
	[GFSnackBarView showGeneralWithMessage:message error:false withTitleError:nil withLoading:true buttonDoneLabel:nil buttonDoneCallback:nil buttonCancelLabel:nil buttonCancelCallback:nil permanent:false];
}

+ (void)showWithMessage:(NSString*)message withTitleError:(NSString*)titleError {
	[GFSnackBarView showGeneralWithMessage:message error:true withTitleError:titleError withLoading:false buttonDoneLabel:nil buttonDoneCallback:nil buttonCancelLabel:nil buttonCancelCallback:nil permanent:false];
}

+ (void)showWithMessage:(NSString*)message withTitleError:(NSString*)titleError permanent:(bool)permanent {
	[GFSnackBarView showGeneralWithMessage:message error:true withTitleError:titleError withLoading:false buttonDoneLabel:nil buttonDoneCallback:nil buttonCancelLabel:nil buttonCancelCallback:nil permanent:permanent];
}

+ (void)showWithMessage:(NSString*)message withTitleError:(NSString*)titleError buttonDoneLabel:(NSString*)buttonDoneLabel buttonDoneCallback:(void (^)(void))buttonDoneCallback {
	[GFSnackBarView showGeneralWithMessage:message error:true withTitleError:titleError withLoading:false buttonDoneLabel:buttonDoneLabel buttonDoneCallback:buttonDoneCallback buttonCancelLabel:nil buttonCancelCallback:nil permanent:false];
}

+ (void)showWithMessage:(NSString*)message withTitleError:(NSString*)titleError buttonDoneLabel:(NSString*)buttonDoneLabel buttonDoneCallback:(void (^)(void))buttonDoneCallback
	  buttonCancelLabel:(NSString*)buttonCancelLabel buttonCancelCallback:(void (^)(void))buttonCancelCallback {
	[GFSnackBarView showGeneralWithMessage:message error:true withTitleError:titleError withLoading:false buttonDoneLabel:buttonDoneLabel buttonDoneCallback:buttonDoneCallback buttonCancelLabel:buttonCancelLabel buttonCancelCallback:buttonCancelCallback permanent:false];
}

+ (void)showGeneralWithMessage:(NSString*)message error:(bool)error withTitleError:(NSString*)titleError withLoading:(bool)withLoading buttonDoneLabel:(NSString*)buttonDoneLabel buttonDoneCallback:(void (^)(void))buttonDoneCallback buttonCancelLabel:(NSString*)buttonCancelLabel buttonCancelCallback:(void (^)(void))buttonCancelCallback permanent:(bool)permanent {
	GFSnackBarView *view = [GFSnackBarView privateInstance];
	view.isShow = true;
	
	if (view.isLoading) {
		//with animation
		[UIView transitionWithView:view
						  duration:0.3
						   options:UIViewAnimationOptionTransitionCrossDissolve
						animations:^{
			view.message.text = message;
		} completion:nil];
	} else {
		view.message.text = message;
	}
	view.title.text = titleError;
	view.permanent = permanent;
	[view setConstraintWithError:error withLoading:withLoading];
	
	if (titleError == nil) {
		view.title.hidden = true;
	} else {
		view.title.hidden = false;
	}
	
	if (message == nil) {
		view.message.hidden = true;
	} else {
		view.message.hidden = false;
	}
	
	if (buttonDoneLabel!=nil) {
		view.buttonDone.hidden = false;
		[view.buttonDone setTitle:buttonDoneLabel forState:UIControlStateNormal];
	} else {
		view.buttonDone.hidden = true;
	}
	view.buttonDoneCallback = buttonDoneCallback;
	
	if (buttonCancelLabel!=nil) {
		view.buttonCancel.hidden = false;
		view.buttonDoneConstraintX.constant = 24;
		view.buttonCancelConstraintX.constant = -24;
		[view.buttonCancel setTitle:buttonCancelLabel forState:UIControlStateNormal];
		view.title.textColor = [UIColor lightGrayColor];
	} else {
		view.buttonDoneConstraintX.constant = 0;
		view.buttonCancelConstraintX.constant = 0;
		view.buttonCancel.hidden = true;
		view.title.textColor = [UIColor colorWithRed:255 green:47 blue:43 alpha:1.0];
	}
	view.buttonCancelCallback = buttonCancelCallback;
	
	[UIView animateWithDuration:animationDuration
						  delay:0.1
						options: UIViewAnimationOptionCurveEaseInOut
					 animations:^{
		view.frame = CGRectMake(0, view.screenRect.size.height-heightView, view.screenRect.size.width, heightView); //bottom
	}
					 completion:^(BOOL finished) {
		if (!view.isLoading && view.buttonDoneCallback==nil && !view.permanent) {
			[view performSelector:@selector(hide) withObject:nil afterDelay:hideDelay];
		}
	}];
	
}

- (void)hide {
	//    SnackBarView *view = [SnackBarView privateInstance];
	if (!_isShow) {
		//        NSLog(@"Snackbar already hide");
		return;
	}
	if (_isLoading) {
		//        NSLog(@"Snackbar is loading");
		return;
	}
	if (_buttonDoneCallback!=nil) {
		//        NSLog(@"Snackbar has buttonDoneCallback");
		return;
	}
	
	_isShow = false;
	//    NSLog(@"Snackbar hide");
	[UIView animateWithDuration:animationDuration
						  delay:0.0
						options: UIViewAnimationOptionCurveEaseInOut
					 animations:^{
		self.frame = CGRectMake(0, self.screenRect.size.height, self.screenRect.size.width, heightView);
	}
					 completion:^(BOOL finished) {
		
	}];
	
}


@end
