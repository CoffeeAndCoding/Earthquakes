//
//  EQEDetailViewController.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/20/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQEDetailViewController.h"

@interface EQEDetailViewController ()

@end

@implementation EQEDetailViewController

@synthesize quake;
@synthesize centerCoordinate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = quake.title;
    
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
    magnitudeField.text = [NSString stringWithFormat:@"%f", quake.magnitude];
    depthField.text = [NSString stringWithFormat:@"%f", quake.depth];
    latitudeField.text = [NSString stringWithFormat:@"%f", quake.latitude];
    longitutdeField.text = [NSString stringWithFormat:@"%f", quake.longitude];
    dateField.text = quake.date;
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findNearby:(id)sender {
    
}

- (IBAction)share:(id)sender {
}
@end
