//
//  EQEListViewController.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/17/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQEListViewController.h"
#import "EQEApiRequest.h"
#import "EQEEntry.h"
#import "EQEWebViewController.h"
#import "SortSelectorTableView.h"
#import "FPPopoverController.h"
#import "EQEDetailViewController.h"


@interface EQEListViewController () 

@property (nonatomic) NSArray *eqeEntries;

@end

@implementation EQEListViewController

@synthesize webViewController;
@synthesize eqeEntries;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Recent Earthquakes";
    
    
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    [self doRefresh:nil];

    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sort" style:UIBarButtonItemStylePlain target:self action:@selector(sortButtonSelected:)];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];

    
    }

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self) {
        
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    EQEEntry *e = [self.eqeEntries objectAtIndex:[indexPath row]];
    cell.textLabel.text = e.title;
    cell.detailTextLabel.text = e.earthquakeRating;
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eqeEntries.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EQEDetailViewController *detailViewController = [[EQEDetailViewController alloc] init];
    
    EQEEntry *entry = [self.eqeEntries objectAtIndex:indexPath.row];

    detailViewController.quake = entry;
    
    //Push to top of stack
    [[self navigationController] pushViewController:detailViewController animated:YES];
    }

#pragma mark - APIRequestDelegat

- (void)apiRequest:(EQEApiRequest *)request didFinishWithResults:(NSArray *)results
{
    self.eqeEntries = results;
    NSLog(@"%@", [[results objectAtIndex:0] title]);
    [self.tableView reloadData];
}

#pragma mark - actions

- (void)doRefresh:(id)sender
{
    EQEApiRequest *request = [[EQEApiRequest alloc] init];
    request.delegate = self;
    
    [request start];
    
    [self.refreshControl endRefreshing];

}

- (IBAction)sortButtonSelected:(id)sender;

{
    UIBarButtonItem *buttonItem = sender;
    UIView *btnView = [buttonItem valueForKey:@"view"];
    
    SortSelectorTableView *sortController = [[SortSelectorTableView alloc] init];
    
    //external controller
    FPPopoverController *popover= [[FPPopoverController alloc] initWithViewController:sortController];
    popover.arrowDirection = FPPopoverArrowDirectionUp;
    popover.tint = FPPopoverLightGrayTint;
    popover.alpha = 0.9;
    [popover presentPopoverFromView:btnView];
    
    
}







@end
