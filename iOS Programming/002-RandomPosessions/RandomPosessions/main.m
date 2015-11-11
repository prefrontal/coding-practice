//
//  main.m
//  RandomPosessions
//
//  Created by Craig Bennett on 11/10/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "BNRItem.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        BNRItem *p = [BNRItem new];

        // This creates a new NSString, "Red Sofa", and gives it to the BNRItem
        [p setItemName: @"Red Sofa"];

        // This creates a new NSString, "A1B2C", and gives it to the BNRItem
        [p setSerialNumber: @"A1B2C"];

        // We send the value 100 to be used as the valueInDollars of this BNRItem
        [p setValueInDollars: 100];

        NSLog (@"%@", p);
    }

    return 0;
}

