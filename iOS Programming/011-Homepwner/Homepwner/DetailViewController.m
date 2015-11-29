//
//  DetailViewController.m
//  Homepwner
//
//  Created by Craig Bennett on 11/28/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "DetailViewController.h"

#import "BNRItem.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize item;

- (void) setItem:(BNRItem *)i
{
    item = i;
    [[self navigationItem] setTitle:[item itemName]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [_nameField setText:[item itemName]];
    [_serialField setText: [item serialNumber]];

    [_valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];

    // Create a NSDataFormatter that will turn the date into a simple date string
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];

    // Use filtered NSDate object to set dateLabel contents
    [_dateLabel setText:[dateFormatter stringFromDate:[item dateCreated]]];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // Clear first responder
    [[self view] endEditing:YES];

    // "Save" changes to item
    [item setItemName:[_nameField text]];
    [item setSerialNumber:[_serialField text]];
    [item setValueInDollars:[[_valueField text] intValue]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
