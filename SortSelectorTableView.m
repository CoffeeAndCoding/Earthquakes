//
//  SortSelectorTableView.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/20/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "SortSelectorTableView.h"

@implementation SortSelectorTableView
@synthesize sortOptions;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sortOptions = [[NSArray alloc] initWithObjects:@"Magnitude", @"Date & Time", @"Depth", @"Distance", nil];
    
}

#pragma marks - table view delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sortOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
    cell.textLabel.text = [sortOptions objectAtIndex: indexPath.row];
}

    return cell;
}

@end
