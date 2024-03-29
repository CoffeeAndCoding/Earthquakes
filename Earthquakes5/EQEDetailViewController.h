//
//  EQEDetailViewController.h
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/20/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>

#import <CoreLocation/CoreLocation.h>
#import "EQEEntry.h"


@interface EQEDetailViewController : UIViewController <UINavigationControllerDelegate, UITextFieldDelegate, MKMapViewDelegate, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate>

{
    CLLocationManager *locationManager;

    __weak IBOutlet UITextField *locationField;
    
    __weak IBOutlet UITextField *dateField;
    
    __weak IBOutlet UITextField *magnitudeField;
    
    __weak IBOutlet UITextField *depthField;
    
    __weak IBOutlet UITextField *latitudeField;
    
    __weak IBOutlet UITextField *longitutdeField;
    
    __weak IBOutlet MKMapView *mapView;
}

@property (nonatomic, strong)EQEEntry *quake;

@property (nonatomic) CLLocationCoordinate2D centerCoordinate;


- (IBAction)findNearby:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)linkToWeb:(id)sender;

@end

