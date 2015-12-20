//
//  InterfaceController.h
//  WatchTest WatchKit Extension
//
//  Created by Craig Bennett on 11/15/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *airportName;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *metarText;

@end
