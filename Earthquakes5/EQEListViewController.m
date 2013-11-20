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

@interface EQEListViewController ()

@property (nonatomic) NSArray *eqeEntries;

@end

@implementation EQEListViewController

- (void)viewDidLoad
{
    
    EQEApiRequest *request = [[EQEApiRequest alloc] init];
    request.delegate = self;
    
    [request start];
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

#pragma mark - APIRequestDelegate

- (void)apiRequest:(EQEApiRequest *)request didFinishWithResults:(NSArray *)results
{
    self.eqeEntries = results;
    NSLog(@"%@", [[results objectAtIndex:0] title]);
    [self.tableView reloadData];
}

@end
