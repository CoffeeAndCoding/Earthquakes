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
#import "EQEDetailViewController.h"
#import "EQESortingClass.h"
#import "EQECustomCell.h"


@interface EQEListViewController () <UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *sortOptions;
@property (nonatomic) EQESortingClass *sortingActor;


@end

@implementation EQEListViewController

@synthesize eqeEntries;
@synthesize sortingActor;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"EQECustomCell" bundle:nil];
    
    [[self tableView] registerNib:nib   forCellReuseIdentifier:@"EQECustomCell"];
    
    self.title = @"Recent Earthquakes";
    
    
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    [self doRefresh:nil];

    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sort" style:UIBarButtonItemStylePlain target:self action:@selector(sortButtonSelected:)];
    
    

    
    }

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self) {
        
        EQESortingClass *sortingClass = [[EQESortingClass alloc] init];
        self.sortingActor = sortingClass;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
       
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EQEEntry *e = [self.eqeEntries objectAtIndex:[indexPath row]];
    
    EQECustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EQECustomCell"];
    
    cell.locationLabel.text = e.location;
    cell.magLabel.text = [NSString stringWithFormat:@"%0.1f", e.magnitude];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    
    cell.dateLabel.text = [NSString stringWithFormat:@"%@ (UTC)", [dateFormatter stringFromDate: e.date]];
    cell.ratingLabel.text = e.earthquakeRating;
    
    // NSLog(@"%@", [array objectAtIndex:0]);
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
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Sort by" delegate: self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    
    for (NSString *sortby in sortingActor.arrayOfOptions) {
        [actionSheet addButtonWithTitle:sortby];
        
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
    
    

    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    eqeEntries = [eqeEntries sortedArrayUsingDescriptors:[NSArray arrayWithObject:[sortingActor sortDescriptorForSortingOptionsIndex:buttonIndex]]];
    [self.tableView reloadData];
}


#pragma mark - CLLocation








@end
