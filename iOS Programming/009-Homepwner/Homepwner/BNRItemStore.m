//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Craig Bennett on 11/22/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "BNRItemStore.h"

#import "BNRItem.h"

@implementation BNRItemStore

+ (BNRItemStore *) sharedStore
{
    static BNRItemStore *sharedStore = nil;

    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];

    return sharedStore;
}

+ (id) allocWithZone: (NSZone *)zone
{
    return [self sharedStore];
}

- (id) init
{
    self = [super init];

    if (self)
    {
        allItems = [[NSMutableArray alloc] init];
    }

    return self;
}

- (NSArray *) allItems
{
    return allItems;
}

- (BNRItem *) createItem
{
    BNRItem *p = [BNRItem randomItem];

    [allItems addObject:p];

    return p;
}

@end


