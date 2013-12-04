//
//  EQESortingClass.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/27/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQESortingClass.h"
#import "EQEDetailViewController.h"
#import "EQEApiRequest.h"
#import "EQEEntry.h"
#import "EQEListViewController.h"

@interface EQESortingClass ()

@property NSArray *sortedArray;
@property NSArray *unsortedResults;
@property NSMutableArray *sortDescriptorArray;



@end

@implementation EQESortingClass

@synthesize sortDescriptorArray;
@synthesize unsortedResults;
@synthesize sortedArray;

- (id)init
{

self =[ super init ];

if (self)
{
    self.arrayOfOptions = [[NSMutableArray alloc] initWithObjects:@"Date", @"Magnitude", @"Distance", @"Depth", @"Location", nil];
    
    self.sortDescriptorArray = [[NSMutableArray alloc] init];
    
    NSSortDescriptor *dateSort = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    [self.sortDescriptorArray addObject:dateSort];
    NSSortDescriptor *magnitudeSort = [[NSSortDescriptor alloc] initWithKey:@"magnitude" ascending:YES];
    [self.sortDescriptorArray addObject:magnitudeSort];
    NSSortDescriptor *distanceSort = [[NSSortDescriptor alloc] initWithKey:@"distance" ascending:YES];
    [self.sortDescriptorArray addObject:distanceSort];
    NSSortDescriptor *depthSort = [[NSSortDescriptor alloc] initWithKey:@"depth" ascending:YES];
    [self.sortDescriptorArray addObject:depthSort];
    NSSortDescriptor *locationSort = [[NSSortDescriptor alloc] initWithKey:@"location" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    [self.sortDescriptorArray addObject:locationSort];
    
    
}
return self;


}



- (NSSortDescriptor *)sortDescriptorForSortingOptionsIndex:(NSInteger)index
{
    return [sortDescriptorArray objectAtIndex:index];
        
   }



#pragma mark - APIRequestDelegat

- (void)apiRequest:(EQEApiRequest *)request didFinishWithResults:(NSArray *)results
{
    self.unsortedResults = results;
}

@end
