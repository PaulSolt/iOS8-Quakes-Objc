//
//  LSIQuakeFetcher.m
//  iOS6-Quakes-Objc
//
//  Created by Paul Solt on 7/16/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIQuakeFetcher.h"
#import "LSIQuake.h"

@implementation LSIQuakeFetcher

static NSString *baseURLString = @"https://earthquake.usgs.gov/fdsnws/event/1/query";

- (void)fetchQuakesFromDateInterval:(NSDateInterval *)dateInterval
                  completitionBlock:(LSIQuakeFetcherCompletionBlock)completionBlock {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    // Query Parameters
    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
    NSString *startTimeString = [formatter stringFromDate:dateInterval.startDate];
    NSString *endTimeString = [formatter stringFromDate:dateInterval.endDate];
    
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"format" value:@"geojson"],
                            [NSURLQueryItem queryItemWithName:@"starttime" value:startTimeString],
                            [NSURLQueryItem queryItemWithName:@"endtime" value:endTimeString],
                            ];
    
    urlComponents.queryItems = queryItems;
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    NSURLSessionDataTask *task =
		[[NSURLSession sharedSession] dataTaskWithURL:url
									completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        // Handle the responses (error vs. data)

        // Call the completion block as needed
        // check the errors
        
        if (error) {
            NSLog(@"Error fetching quakes: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        // parse the data
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        // TODO: Parse the data

		NSLog(@"JSON: %@", json);

			// Convert from Dictionary to a [Quake] using NSArray
			
			NSArray *earthQuakeFeatures = json[@"features"];
			NSMutableArray *quakes = [[NSMutableArray alloc] init];
			
			for (NSDictionary *dictionary in earthQuakeFeatures) {
				LSIQuake *quake = [[LSIQuake alloc] initWithDictionary:dictionary];
				
				if (quake) {
					[quakes addObject:quake]; // append() from Swift
				}
			}
			
			completionBlock(quakes, nil);
        
    }];
    [task resume];
    
    
    
}


- (void)fetchQuakesWithCompletionBlock:(LSIQuakeFetcherCompletionBlock)completionBlock {
    NSDate *endDate = [NSDate date]; // Date()
    NSDate *startDate = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:endDate options:0];
    
    NSDateInterval *dateInterval = [[NSDateInterval alloc] initWithStartDate:startDate endDate:endDate];
    
    [self fetchQuakesFromDateInterval:dateInterval completitionBlock:completionBlock];
}


@end
