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
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"Homepwner"];

        for (int i = 0; i < 5; i++)
        {
            [[BNRItemStore sharedStore] createItem];
        }

        // Create a new bar button item that will send addNetItem: to ItemsViewController
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];

        // Set this bar button item as the right item in the navigationItem
        [[self navigationItem] setRightBarButtonItem:bbi];

        // Create a new bar button item that will toggle editing mode
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }

    return self;
}

- (id) initWithStyle
{
    return [self init];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];

    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = [items objectAtIndex:[indexPath row]];

    // Give detail view controller a pointer to the item object in row
    [detailViewController setItem: selectedItem];

    // Push it one top of the navigation controller's stack
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

#pragma mark Table Edit Mode Methods

- (IBAction) addNewItem:(id)sender
{
    // Create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];

    // Figure out where that item is in the array
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];

    // Insert this new row into the table
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
}

- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return @"Remove";
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        BNRItemStore *ps = [BNRItemStore sharedStore];
        NSArray *items = [ps allItems];
        BNRItem *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];

        // We also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}

@end
