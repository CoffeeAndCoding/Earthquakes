//
//  EQESortingClass.h
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/27/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EQEApiRequest.h"


@interface EQESortingClass : NSObject <ApiRequestDelegate, UIActionSheetDelegate>


@property (strong, nonatomic)NSArray *arrayOfOptions;

- (NSSortDescriptor *)sortDescriptorForSortingOptionsIndex:(NSInteger)index;


@end
