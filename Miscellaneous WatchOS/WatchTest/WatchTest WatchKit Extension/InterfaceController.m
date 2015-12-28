//
//  InterfaceController.m
//  WatchTest WatchKit Extension
//
//  Created by Craig Bennett on 11/15/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];

    // Configure interface objects here.
    
    [_airportName setText:@"KSBA"];
    [_metarText setText:@"KSBA 202253Z VRB04KT 10SM CLR 17/01 A3013 RMK AO2 SLP202 T01670011"];
    
}

- (void)willActivate
{
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate
{
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



