//
//  EQEEntry.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/17/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQEEntry.h"

@implementation EQEEntry




- (id)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        self.earthquakeRating = [[[json valueForKey:@"title"] componentsSeparatedByString:@" "] objectAtIndex:0];
        self.title = [json valueForKey:@"title"]; // componentsSeparatedByString:@" - "]objectAtIndex:1];
        self.link = [json valueForKey:@"link"];
        self.latitude = [[json valueForKey:@"latitude"] doubleValue];
        self.longitude = [[json valueForKey:@"longitude"] doubleValue];
        self.magnitude = [[json valueForKey:@"magnitude"] floatValue];
        self.location = [[[json valueForKey:@"location"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] capitalizedString];
        self.depth = [[json valueForKey:@"depth"] doubleValue];
        self.unformattedDate = [[[json valueForKey:@"date_time"] componentsSeparatedByString:@"+"] objectAtIndex:0];
        
    
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
        self.date = [dateFormatter dateFromString:self.unformattedDate];
        
        
        
     
    }
    
    return self;
}

@end
