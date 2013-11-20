//
//  EQEApiRequest.h
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/17/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ApiRequestDelegate;


@interface EQEApiRequest : NSObject


@property (nonatomic, weak) id<ApiRequestDelegate> delegate;

- (void)start;
- (NSArray *)cachedData;


@end


@protocol ApiRequestDelegate <NSObject>

- (void)apiRequest:(EQEApiRequest *)request didFinishWithResults:(NSArray *)results;

@end
