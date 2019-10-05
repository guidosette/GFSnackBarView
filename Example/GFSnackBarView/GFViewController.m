//
//  GFViewController.m
//  GFSnackBarView
//
//  Created by guidosette on 10/04/2019.
//  Copyright (c) 2019 guidosette. All rights reserved.
//

#import "GFViewController.h"
#import "GFSnackBarView.h"

@interface GFViewController ()

@end

@implementation GFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction) showSimple {
	[GFSnackBarView showWithMessage:@"Test"];
}

- (IBAction) showSimplePermanent {
	[GFSnackBarView showWithMessage:@"Test" permanent:true];
}

- (IBAction) showSimpleError {
	[GFSnackBarView showWithMessage:@"Test error" withTitleError:@"Error"];
}

- (IBAction) showSimpleErrorPermanent {
	[GFSnackBarView showWithMessage:@"Test" withTitleError:@"Error" permanent:true];
}

- (IBAction) showMessageWithLoading {
	[GFSnackBarView showMessageWithLoading:@"Test"];
}

- (IBAction) showMessageCallback {
	[GFSnackBarView showWithMessage:@"Test" withTitleError:@"Error" buttonDoneLabel:@"Ok" buttonDoneCallback:^{
		NSLog(@"Done");
	}];
}

- (IBAction) showMessageConfirmCallback {
	[GFSnackBarView showWithMessage:@"Test" withTitleError:@"Error" buttonDoneLabel:@"Ok" buttonDoneCallback:^{
		NSLog(@"Done");
	} buttonCancelLabel:@"Cancel" buttonCancelCallback:^{
		NSLog(@"Cancel");
	}];
}

@end
