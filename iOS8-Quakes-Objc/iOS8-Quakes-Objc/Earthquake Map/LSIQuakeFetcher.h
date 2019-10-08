//
//  LSIQuakeFetcher.h
//  iOS6-Quakes-Objc
//
//  Created by Paul Solt on 7/16/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// Block (Closure in Swift)
// typedef is like typealias in Swift
// Type: LSIQuakeFetcherCompletionBlock
//typealias QuakeFetcherCompletion = ([Quake]?, Error?) -> ()  // Swift
typedef void (^LSIQuakeFetcherCompletionBlock)(NSArray *, NSError *);

@interface LSIQuakeFetcher : NSObject

- (void)fetchQuakesFromDateInterval:(NSDateInterval *)dateInterval
                  completitionBlock:(LSIQuakeFetcherCompletionBlock)completionBlock;

- (void)fetchQuakesWithCompletionBlock:(LSIQuakeFetcherCompletionBlock)completionBlock;

@end
