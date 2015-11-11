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
        NSMutableArray *items = [NSMutableArray new];

        for (int i = 0; i < 10; i++)
        {
            BNRItem *p = [BNRItem randomItem];
            [items addObject:p];
        }

        for (BNRItem *item in items)
        {
            NSLog (@"%@", item);
        }
    }

    return 0;
}

