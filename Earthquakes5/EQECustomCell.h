//
//  EQECustomCell.h
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/29/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EQECustomCell : UITableViewCell <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *magLabel;


@end
