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
	XCTAssertEqualObjects(@"10km SSW of Idyllwild, CA", quake.place);
	// OBJC: Compare objects not memory addresses (XCTAssertEqual will compare pointer memory locations)
	NSDate *expectedDate = [NSDate dateWithTimeIntervalSince1970:1388620296020 / 1000.0];
	XCTAssertEqualObjects(expectedDate, quake.time);
	
	// TODO: Create a latitude/longitude test
	
}


@end
