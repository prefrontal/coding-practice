//
//  ViewController.m
//  Whereami
//
//  Created by Craig Bennett on 11/12/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "ViewController.h"

#import "BNRMapPoint.h"

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

#pragma mark General Controller Methods

- (void) findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void) foundLocation: (CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];

    // Create an instance of BNRMapPoint with the current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];

    // Add it to the map view
    [worldView addAnnotation:mp];

    // Zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (coord, 250, 250);
    [worldView setRegion:region animated:YES];

    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

#pragma mark Location Manager Delegate Methods

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // How many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];

    // CLLocationManagers will retun the las found location of the device first,
    // you don't want the data in this case.  If this location was more than
    // three minutes ago then ignore it.

    if (t < -180)
    {
        // This is cached data, ignore it
        return;
    }

    [self foundLocation:newLocation];
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

#pragma mark Text Field Delegate methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];

    return YES;
}

@end
