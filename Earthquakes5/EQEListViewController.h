//
//  EQEListViewController.h
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/17/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EQEApiRequest.h"
#import "EQEEntry.h"

@class EQEWebViewController;

@interface EQEListViewController : UITableViewController <ApiRequestDelegate>

{
    
   
}
@property (nonatomic) EQEWebViewController *webViewController;


@end
