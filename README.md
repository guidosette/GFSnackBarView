# GFSnackBarView

[![CI Status](https://img.shields.io/travis/guidosette/GFSnackBarView.svg?style=flat)](https://travis-ci.org/guidosette/GFSnackBarView)
[![Version](https://img.shields.io/cocoapods/v/GFSnackBarView.svg?style=flat)](https://cocoapods.org/pods/GFSnackBarView)
[![License](https://img.shields.io/cocoapods/l/GFSnackBarView.svg?style=flat)](https://cocoapods.org/pods/GFSnackBarView)
[![Platform](https://img.shields.io/cocoapods/p/GFSnackBarView.svg?style=flat)](https://cocoapods.org/pods/GFSnackBarView)

## Example

![Alt Text](https://github.com/guidosette/GFSnackBarView/blob/master/photo.gif)

Simple and customizable Snackbar. You can use it to show message, message with error, with loading or to confirm.

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

GFSnackBarView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GFSnackBarView'
```

## How to use

    #import "GFSnackBarView.h"

    [GFSnackBarView showWithMessage:@"Test error" withTitle:@"Error" isError:true permanent:false];

    [GFSnackBarView showWithMessage:@"Test" withTitle:@"Error" isError:true buttonDoneLabel:@"Ok" buttonDoneCallback:^{
		NSLog(@"Done");
	} buttonCancelLabel:@"Cancel" buttonCancelCallback:^{
		NSLog(@"Cancel");
	}];

## Author

guidosette, guido.fanfani7@gmail.com

## License

GFSnackBarView is available under the MIT license. See the LICENSE file for more info.
