//
//  LSIQuakesTests.m
//  iOS8-Quakes-ObjcTests
//
//  Created by Paul Solt on 10/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "LSIQuake.h"

@interface LSIQuakesTests : XCTestCase

@end

@implementation LSIQuakesTests

- (void)testParseQuakeJSON {
	
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSData *data = loadFile(@"Quake.json",bundle);
	
	XCTAssertNotNil(data);
	NSLog(@"Data; %@", data);

	NSError *error = nil;
	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	
	NSLog(@"Error: %@", error);
	NSLog(@"JSON: %@", json);
	
	LSIQuake *quake = [[LSIQuake alloc] initWithDictionary: json];
	XCTAssertNotNil(quake);
	
	// Test all the properties are parsing correctly
	XCTAssertEqualWithAccuracy(1.29, quake.magnitude, 0.001);
	
}


@end
