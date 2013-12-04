//
//  EQEWebView.h
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 12/4/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EQEWebView : UIViewController
@property (nonatomic, readonly) UIWebView *webView;

- (UIWebView *)loadWebView;

@end
