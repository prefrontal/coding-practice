//
//  DetailViewController.h
//  Homepwner
//
//  Created by Craig Bennett on 11/28/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) BNRItem *item;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
