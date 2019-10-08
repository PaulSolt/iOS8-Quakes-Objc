//
//  EarthquakesViewController.h
//  iOS8-Quakes-Objc
//
//  Created by Paul Solt on 10/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward delcare class in header, include it in the implementation file
@class LSIQuakeFetcher;

@interface EarthquakesViewController : UIViewController

@property LSIQuakeFetcher *quakeFetcher;

@end
