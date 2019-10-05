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
@property (strong, nonatomic) IBOutlet UISwitch *withTitle;
@property (strong, nonatomic) IBOutlet UISwitch *titleError;
@property (strong, nonatomic) IBOutlet UISwitch *permanent;

@end

@implementation GFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction) show {
	[GFSnackBarView showWithMessage:@"Test error" withTitle:_withTitle.on ? @"Error" : nil isError:_titleError.on permanent:_permanent.on];
}

- (IBAction) showMessageWithLoading {
	[GFSnackBarView showMessageWithLoading:@"Test"];
}

- (IBAction) showMessageCallback {
	_permanent.on = true;
	[GFSnackBarView showWithMessage:@"Test" withTitle:_withTitle.on ? @"Error" : nil isError:_titleError.on buttonDoneLabel:@"Ok" buttonDoneCallback:^{
		NSLog(@"Done");
	}];
}

- (IBAction) showMessageConfirmCallback {
	_permanent.on = true;
	[GFSnackBarView showWithMessage:@"Test" withTitle:_withTitle.on ? @"Error" : nil isError:_titleError.on buttonDoneLabel:@"Ok" buttonDoneCallback:^{
		NSLog(@"Done");
	} buttonCancelLabel:@"Cancel" buttonCancelCallback:^{
		NSLog(@"Cancel");
	}];
}

@end
