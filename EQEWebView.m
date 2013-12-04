//
//  EQEWebView.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 12/4/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQEWebView.h"
#import "EQEEntry.h"

@implementation EQEWebView




-(void)loadView
{
    // Create an instance of UIWebView as large as the screen
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    UIWebView *wv = [[UIWebView alloc] initWithFrame:screenFrame];
    // Tell web view to scale web content to fit within bounds of webview
    [wv setScalesPageToFit:YES];
    
    
    [self setView:wv];
}

- (UIWebView *)loadWebView
{
    return (UIWebView *)[self view];
}




@end
