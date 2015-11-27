//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Craig Bennett on 11/22/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "ItemsViewController.h"

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

- (id) init
{
    // Call the superclass designated initializer
    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self)
    {
        for (int i = 0; i < 5; i++)
        {
            [[BNRItemStore sharedStore] createItem];
        }
    }

    return self;
}

- (id) initWithStyle
{
    return [self init];
}

#pragma mark UITableView

//- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [[[BNRItemStore sharedStore] allItems] count];
//}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check for a reusable cell first, use that if it exists
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    if (!cell)
    {
        // Create an instance of UITableViewCell, with default appearance
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }

    // Set the text on the cell of the cell with the desciption of the item that is at the nth index
    // of items, where n = row this cell will appear on in the tableview

    NSMutableArray *tempArray = [NSMutableArray new];

    for (BNRItem *p in [[BNRItemStore sharedStore] allItems])
    {
        if ((indexPath.section == 0) && (p.valueInDollars < 50))
            [tempArray addObject:p];
        else if ((indexPath.section == 1) && (p.valueInDollars > 50))
            [tempArray addObject:p];
    }

    BNRItem *p = [tempArray objectAtIndex:[indexPath row]];

    [[cell textLabel] setText:[p description]];

    return cell;
}

// ----------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return @"< $50";
    else
        return @"> $50";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger count = 0;

    for (BNRItem *p in [[BNRItemStore sharedStore] allItems])
    {
        if (section == 0)
        {
            if (p.valueInDollars < 50)
                count++;
        }
        else if (section == 1)
        {
            if (p.valueInDollars > 50)
                count++;
        }
    }

    return count;
}

@end
