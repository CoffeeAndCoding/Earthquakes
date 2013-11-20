//
//  EQEEntry.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/17/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQEEntry.h"

@implementation EQEEntry




- (id)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        self.title = [json valueForKey:@"title"];
        self.link = [json valueForKey:@"link"];
    }
    
    return self;
}

@end
