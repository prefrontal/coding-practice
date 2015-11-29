//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Craig Bennett on 11/22/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

- (IBAction) addNewItem: (id)sender;

@end
