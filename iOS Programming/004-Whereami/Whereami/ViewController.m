//
//  ViewController.m
//  Whereami
//
//  Created by Craig Bennett on 11/12/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark Initialization

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Create location manager obejct and set delegate
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    
    // Ask the user for permission to determine location
    [locationManager requestWhenInUseAuthorization];
}

#pragma mark Location Manager Delegate Methods

-(void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways)
    {
        // Make it as accurate as possible, regardless of power or time
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];

        // Tell the manager to start looking for its location immediately
        [locationManager startUpdatingLocation];
    }
}

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog (@"%@", newLocation);
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    NSLog (@"Could not find location: %@", error);
}

@end
