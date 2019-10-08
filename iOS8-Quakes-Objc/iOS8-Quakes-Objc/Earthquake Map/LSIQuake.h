//
//  LSIQuake.h
//  iOS8-Quakes-Objc
//
//  Created by Paul Solt on 10/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSIQuake : NSObject

// Properties
@property double magnitude;
@property NSString *place;
@property NSDate *time;
//@property double latitude;	// TODO: implement these properties
//@property double longitude;

// Primitive data types
// double, int, float, char (single character),

// char * = c-string = "Paul"
// NSString = @"Dave"
// NSString = object
// CGRect, NSRect = structs (primitive types, not objects)
// NSTimeInterval, NSInteger, NSUInteger = primitive type



// Methods
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
