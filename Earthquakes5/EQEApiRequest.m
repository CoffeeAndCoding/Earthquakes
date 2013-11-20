//
//  EQEApiRequest.m
//  Earthquakes5
//
//  Created by TRAVIS SWANSON on 11/17/13.
//  Copyright (c) 2013 TRAVIS SWANSON. All rights reserved.
//

#import "EQEApiRequest.h"
#import "EQEEntry.h"

@interface EQEApiRequest() <NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (nonatomic) NSMutableData *data;

@end


@implementation EQEApiRequest


- (void)start
{
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://earthquake-report.com/feeds/recent-eq?json"]];
    
    //Spawn the connection
    NSURLConnection *dataConnection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    [dataConnection start];
    
    
    
}

#pragma mark - URL Connection Delegate 

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (self.data ==nil)
        self.data = [NSMutableData new];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self cacheData];
    
    
    NSError *error = nil;
    
    NSArray *webResults = [NSJSONSerialization JSONObjectWithData:self.data
                          options:0
                                                            error:&error];
   //NSLog(@"%@", [webResults objectAtIndex:0]);

if (error)
{
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:@"Connectivity Issues"
                                                          delegate:self
                                                cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
    [errorAlert show];
} else {
    NSArray *array = [self parseResults:webResults];
    NSLog(@"%@", [array objectAtIndex:0]);

    [self.delegate apiRequest:self didFinishWithResults:array];

}
}

- (NSArray *)parseResults:(NSArray *)results
    {
        NSMutableArray *parsedResults = [NSMutableArray new];
        
        for (NSDictionary *json in results)
        {
            
            EQEEntry *earthquake = [[EQEEntry alloc] initWithJson:json];
            
            [parsedResults addObject:earthquake];
            
        }
        return parsedResults.copy;
        
            
    }

- (void)cacheData
{
    NSURL *cacheDir = [[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].lastObject;
    
    NSURL *path = [cacheDir URLByAppendingPathComponent:@"data"];
    
    [self.data writeToURL:path atomically:YES];
}

- (NSArray *)cachedData
{

    NSURL *cacheDir = [[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].lastObject;
    
    NSData *data = [NSData dataWithContentsOfURL:[cacheDir URLByAppendingPathComponent:@"data"]];
    
    NSArray *results = [[NSArray alloc ]init];
    
    if (data)
    {
        results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        results = [self parseResults:results];
    
    }
    
    return results;
    
}



@end
