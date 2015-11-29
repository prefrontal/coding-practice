//
//  BNRItem.m
//  RandomPosessions
//
//  Created by Craig Bennett on 11/10/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

#pragma mark Accessors

@synthesize containedItem;
@synthesize container;
@synthesize itemName;
@synthesize serialNumber;
@synthesize valueInDollars;
@synthesize dateCreated;

- (void) setContainedItem: (BNRItem *)i
{
    containedItem = i;

    // When given an item to contain the contained item will be
    // given a pointer to its container
    [i setContainer:self];
}

#pragma mark Class Methods

+ (id) randomItem
{
    // Create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];

    // Create an array of three nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];

    // Get the index of a random adjective/noun from the lists
    // Note: the % operator, called the modulo operator, gives
    // you the remainder. So, adjectiveINdex is a random number
    // from 0 to 2 inclusive

    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];

    // Note that NSInteger is not an object, but a type definition for "unsigned long"

    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];

    int randomValue = rand() % 100;

    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];

    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];

    return newItem;
}

#pragma mark Instance Methods



- (id) init
{
    return [self initWithItemName:@"Iten" valueInDollars:0 serialNumber:@""];
}

- (id) initWithItemName: (NSString *)name
         valueInDollars: (int) value
           serialNumber: (NSString *) sNumber;
{
    // Call the designated initializer of the superclass
    self = [super init];

    if (self)
    {
        // Give the instance variables initial values
        [self setItemName: name];
        [self setSerialNumber: sNumber];
        [self setValueInDollars: value];
        dateCreated = [NSDate new];
    }

    // Return the address of the newly initialized object
    return self;
}

- (void) dealloc
{
    NSLog (@"Destroyed: %@", self);
}

- (NSString *) description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat: @"%@ (%@): Worth $%d, recorded on %@",
                                   itemName, serialNumber, valueInDollars, dateCreated];

    return descriptionString;
}

@end
