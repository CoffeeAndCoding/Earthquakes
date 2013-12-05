//
//  EQEEntry.h
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/17/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EQEApiRequest.h"
#import <CoreLocation/CoreLocation.h>


@interface EQEEntry : NSObject<CLLocationManagerDelegate>

{
    CLLocationManager *locationManager;

}
@property (nonatomic) NSString *earthquakeRating;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *link;
@property double latitude;
@property double longitude;
@property float magnitude;
@property (nonatomic) NSString *location;
@property double depth;
@property (nonatomic) NSString *unformattedDate;
@property (nonatomic)NSDate *date;
@property (nonatomic, strong) CLLocation *coordinate;
@property double distance;

@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) CLLocationManager *locationManager;




- (id)initWithJson:(NSDictionary *)json;

@end
