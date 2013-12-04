//
//  EQECustomCell.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/29/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQECustomCell.h"

@implementation EQECustomCell
@synthesize locationLabel, magLabel, ratingLabel;
//@syntesize datelabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
