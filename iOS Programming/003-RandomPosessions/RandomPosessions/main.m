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
        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"Backpack"];

        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];

        [backpack setContainedItem:calculator];

        backpack = nil;

        NSLog (@"Container: %@", [calculator container]);

        calculator = nil;
    }

    return 0;
}

