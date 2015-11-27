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

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

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
    BNRItem *p = [[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];

    [[cell textLabel] setText:[p description]];

    return cell;
}

@end
