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

    [worldView setShowsUserLocation:YES];
}

- (void) dealloc
{
    // Tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}

#pragma mark Location Manager Delegate Methods

//-(void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
//{
//    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways)
//    {
//        // Make it as accurate as possible, regardless of power or time
//        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//
//        [locationManager setDistanceFilter:50];
//        [locationManager setHeadingFilter:0.5];
//
//        // Tell the manager to start looking for its location immediately
//        [locationManager startUpdatingLocation];
//        [locationManager startUpdatingHeading];
//    }
//}

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog (@"%@", newLocation);
}


-(void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog (@"%@", newHeading);
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    NSLog (@"Could not find location: %@", error);
}

#pragma mark Map View Delegate methods

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(nonnull MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 2500, 2500);
    [worldView setRegion:region animated:YES];
}

@end
