//
//  BNRItem.m
//  RandomPosessions
//
//  Created by Craig Bennett on 11/10/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (void) setItemName: (NSString *)str;
{
    itemName = str;
}

- (NSString *) itemName;
{
    return itemName;
}

- (void) setSerialNumber: (NSString *)str;
{
    serialNumber = str;
}

- (NSString *) serialNumber;
{
    return serialNumber;
}

- (void) setValueInDollars: (int)i;
{
    valueInDollars = i;
}

- (int) valueInDollars;
{
    return valueInDollars;
}

- (NSDate *) dateCreated
{
    return dateCreated;
}

- (NSString *) description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat: @"%@ (%@): Worth $%d, recorded on %@",
                                   itemName, serialNumber, valueInDollars, dateCreated];

    return descriptionString;
}

@end
