//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Craig Bennett on 11/14/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>

// A new designated initializer for instances of BNRMapPoint
- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

// This is a required property from MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// This is an optional property from MKAnnotation
@property (nonatomic, copy) NSString *title;

@end
