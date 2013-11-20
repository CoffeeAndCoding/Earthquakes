//
//  EQEWebViewController.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/20/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//


#import "EQEWebViewController.h"

@implementation EQEWebViewController

- (void)loadView
{
    //Create an instance of UIWebview as large a screen
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    UIWebView *wv = [[UIWebView alloc] initWithFrame:screenFrame];
    
    //Scale webcontents to fit within bounds of webview
    [wv setScalesPageToFit:YES];
    [self setView:wv];
}
- (UIWebView *)webView
{
    return (UIWebView *)[self view];
}


@end
