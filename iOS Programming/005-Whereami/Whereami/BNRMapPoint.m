//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Craig Bennett on 11/14/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate, title;

- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];

    if (self)
    {
        coordinate = c;
        [self setTitle:t];
    }

    return self;
}

- (id) init
{
    CLLocationCoordinate2D c = CLLocationCoordinate2DMake (43.07, -89.32);
    return [self initWithCoordinate:c title:@"Hometown"];
}

@end
