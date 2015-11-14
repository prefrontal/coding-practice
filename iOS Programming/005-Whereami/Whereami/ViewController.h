//
//  ViewController.h
//  Whereami
//
//  Created by Craig Bennett on 11/12/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *locationManager;

    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}

@end

