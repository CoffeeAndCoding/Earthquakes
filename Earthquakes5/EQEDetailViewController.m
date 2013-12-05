//
//  EQEDetailViewController.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/20/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQEDetailViewController.h"

#import "EQEWebView.h"

@interface EQEDetailViewController ()

@property (nonatomic, strong) EQEWebView *webView;

@end

@implementation EQEDetailViewController

@synthesize quake;
@synthesize centerCoordinate;
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Details";
    
    [mapView setMapType:MKMapTypeHybrid];
    CLLocationCoordinate2D center;
    center.latitude = quake.latitude;
    center.longitude = quake.longitude;
    
    //Declare span of map
    MKCoordinateSpan span;
    span.latitudeDelta = 2;
    span.longitudeDelta = 1;
    
    //add center and span to a region, adjust region to fit in the mapview
    MKCoordinateRegion region;
    region.center = center;
    region.span = span;
    mapView.region = [mapView regionThatFits:region];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:center];
    [annotation setTitle:@"Epicenter"];
    [mapView addAnnotation:annotation];
    
    
    
    
    }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    locationField.text = quake.location;
    magnitudeField.text = [NSString stringWithFormat:@"%.01f", quake.magnitude];
    depthField.text = [NSString stringWithFormat:@"%.01f", quake.depth];
    latitudeField.text = [NSString stringWithFormat:@"%f", quake.latitude];
    longitutdeField.text = [NSString stringWithFormat:@"%f", quake.longitude];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    

    
    dateField.text = [NSString stringWithFormat:@"%@ (UTC)", [dateFormatter stringFromDate: quake.date]];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findNearby:(id)sender {
    
}

- (IBAction)share:(id)sender {
    //Email Subject
    NSString *emailTitle = [NSString stringWithFormat:@"Crazy earthquake in %@",quake.location];
    
    NSString *messageBody = [NSString stringWithFormat:@"Check out this awesome earthquake!! -->> <a href=%@>EARTHQUAKE</a>", quake.link];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject: emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [self presentViewController:mc animated:YES completion:NULL];
    
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];

}

- (IBAction)linkToWeb:(id)sender {
    EQEWebView *wv = [[EQEWebView alloc] init];
    self.webView = wv;
    
    [[self navigationController] pushViewController: webView animated:YES];
    
    NSURL *url = [NSURL URLWithString:quake.link];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    [[webView loadWebView] loadRequest:req];
    
    webView.navigationItem.title = quake.location;
    

}
@end
