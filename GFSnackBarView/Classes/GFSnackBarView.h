//
//  SnackBarView.h
//  // Fanfa
//
//  Created by Guido Fanfani on 05/10/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFSnackBarView : UIView

/**
 Show snack bar with message.
 @param message A NSString value that determinate the message to show.
 */
+ (void)showWithMessage:(NSString*)message;

/**
 Show snack bar with message.
 @param message A NSString value that determinate the message to show.
 @param permanent message not hide.
 */
+ (void)showWithMessage:(NSString*)message permanent:(bool)permanent;

/**
 Show snack bar with message and title error.
 @param message A NSString value that determinate the message to show.
 @param title A NSString value that determinate the title to show.
 @param isError A Boolean value that determinate the title's color.
 */
+ (void)showWithMessage:(NSString*)message withTitle:(NSString*)title isError:(bool)isError;

/**
 Show snack bar with message and title error.
 @param message A NSString value that determinate the message to show.
 @param title A NSString value that determinate the title to show.
 @param isError A Boolean value that determinate the title's color.
 @param permanent message not hide.
 */
+ (void)showWithMessage:(NSString*)message withTitle:(NSString*)title isError:(bool)isError permanent:(bool)permanent;

/**
 Show snack bar with message and loading view.
 @param message A NSString value that determinate the message to show.
 */
+ (void)showMessageWithLoading:(NSString*)message;

/**
 Call this method when you change root of window.
 */
+ (void)updateRootView:(UIView*)rootView;

/**
 Show snack bar with message and title error.
 @param message A NSString value that determinate the message to show.
 @param title A NSString value that determinate the title to show.
 @param isError A Boolean value that determinate the title's color.
 @param buttonDoneLabel A NSString value that determinate the title of the button
 @param buttonDoneCallback a block called when click button done
 */
+ (void)showWithMessage:(NSString*)message withTitle:(NSString*)title isError:(bool)isError buttonDoneLabel:(NSString*)buttonDoneLabel buttonDoneCallback:(void (^)(void))buttonDoneCallback;

/**
 Show snack bar with message and title error.
 @param message A NSString value that determinate the message to show.
 @param title A NSString value that determinate the title to show.
 @param isError A Boolean value that determinate the title's color.
 @param buttonDoneLabel A NSString value that determinate the title of the done button
 @param buttonDoneCallback a block called when click done button
 @param buttonCancelLabel A NSString value that determinate the title of the cancel button
 @param buttonCancelCallback a block called when click cancel button
 */
+ (void)showWithMessage:(NSString*)message withTitle:(NSString*)title isError:(bool)isError buttonDoneLabel:(NSString*)buttonDoneLabel buttonDoneCallback:(void (^)(void))buttonDoneCallback
		buttonCancelLabel:(NSString*)buttonCancelLabel buttonCancelCallback:(void (^)(void))buttonCancelCallback;

@end
