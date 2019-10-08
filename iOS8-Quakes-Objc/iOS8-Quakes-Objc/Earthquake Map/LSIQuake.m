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
		
		NSNumber *magNumber = properties[@"mag"];
		
		_magnitude = [magNumber doubleValue];
		
		
	}
	return self;
}

@end
