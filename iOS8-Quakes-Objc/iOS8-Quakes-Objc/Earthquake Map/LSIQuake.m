//
//  LSIQuake.m
//  iOS8-Quakes-Objc
//
//  Created by Paul Solt on 10/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIQuake.h"

@implementation LSIQuake

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	self = [super init];
	if (self) {
		
		// Get properties
		// Ask for "mag"
		
		// TODO: Replace with constants for keys
		NSDictionary *properties = dictionary[@"properties"];
		
		// ObjC: All values in NSArray and NSDictionary are objects
		// NSNumber, NSValue
		
		NSNumber *magNumber = properties[@"mag"]; // Object
		NSString *placeString = properties[@"place"];
		
		NSNumber *timeInMillisecondsNumber = properties[@"time"];
		// Make sure to cast to floating-point (double): 5000 -> 5000.0
		NSTimeInterval timeInSeconds = (NSTimeInterval)[timeInMillisecondsNumber longValue] / 1000.0;
		
		// TODO: parse Latitude/Longitude
		
		if (magNumber != nil &&
			placeString != nil &&
			timeInMillisecondsNumber != nil
			) {
			_magnitude = [magNumber doubleValue]; // primative data type
			_place = placeString;
			_time = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
		} else {
			NSLog(@"Error: unable to parse earthquake: %@", dictionary);
			// TODO: import Assert or some other function
			
			return nil;
		}
	}
	return self;
}

- (NSString *)description {
	
	return [NSString stringWithFormat: @"Place: %@, Magnitude: %f", self.place, self.magnitude];
}

// MKAnnotation

- (CLLocationCoordinate2D)coordinate {
	return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}


@end
