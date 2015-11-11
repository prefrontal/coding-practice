//
//  BNRItem.h
//  RandomPosessions
//
//  Created by Craig Bennett on 11/10/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *itemName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}

- (void) setItemName: (NSString *)str;
- (NSString *) itemName;

- (void) setSerialNumber: (NSString *)str;
- (NSString *) serialNumber;

- (void) setValueInDollars: (int)i;
- (int) valueInDollars;

- (NSDate *) dateCreated;

@end
