//
//  BNRItem.h
//  RandomPosessions
//
//  Created by Craig Bennett on 11/10/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

#pragma mark Properties

@property (nonatomic, readwrite, strong) BNRItem *containedItem;
@property (nonatomic, readwrite, weak)   BNRItem *container;

@property (nonatomic, readwrite, copy)   NSString *itemName;
@property (nonatomic, readwrite, copy)   NSString *serialNumber;
@property (nonatomic, readwrite, assign) int valueInDollars;
@property (nonatomic, readonly, retain)  NSDate *dateCreated;

#pragma mark Methods

+ (id) randomItem;

- (id) initWithItemName: (NSString *)name
         valueInDollars: (int) value
           serialNumber: (NSString *) sNumber;

@end
