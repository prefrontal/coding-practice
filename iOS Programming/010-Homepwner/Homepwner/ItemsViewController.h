//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Craig Bennett on 11/22/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

- (UIView *) headerView;
- (IBAction) addNewItem: (id)sender;
- (IBAction) toggleEditingMode: (id)sender;

@end
