//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Craig Bennett on 11/22/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
}

// Note that this method is a class method
+ (BNRItemStore *) sharedStore;

// Instance methods
- (NSArray *) allItems;
- (BNRItem *) createItem;

@end
