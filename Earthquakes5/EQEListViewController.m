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


@interface EQEListViewController ()

@property (nonatomic) NSArray *eqeEntries;

@end

@implementation EQEListViewController

@synthesize webViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Earthquakes";
    
    
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    
    
    [self doRefresh:nil];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    EQEEntry *e = [self.eqeEntries objectAtIndex:[indexPath row]];
    cell.textLabel.text = e.title;
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eqeEntries.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Push the web view controlleronto the navigation stack
    [self.navigationController pushViewController:webViewController animated:YES];
    
    //Grab the entry
    EQEEntry *entry = [self.eqeEntries objectAtIndex:indexPath.row];
    
    //Construct URL with the link string
    NSURL *url = [NSURL URLWithString:entry.link];
    
    //Construct URL Request
    NSURLRequest *req = [NSURLRequest requestWithURL:url];

    //Load the request into the webview
    [webViewController.webView loadRequest:req];
    
    //Set the title of the web view controllers nav item
    webViewController.navigationItem.title = entry.title;
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

@end
