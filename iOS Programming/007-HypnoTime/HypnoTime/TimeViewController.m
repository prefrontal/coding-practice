//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Craig Bennett on 11/15/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()

@end

@implementation TimeViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Get the tab bair item
    UITabBarItem *tbi = [self tabBarItem];

    // Provide the tabe bar with a label
    [tbi setTitle:@"Time"];

    // Provide the tab bar with an image
    UIImage *i = [UIImage imageNamed:@"Time.png"];
    [tbi setImage:i];

    NSLog (@"Time View loaded");
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) viewWillAppear:(BOOL)animated
{
    NSLog (@"Current TimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

- (void) viewWillDisappear:(BOOL)animated
{
    NSLog (@"Current TimeViewController will disappear");
    [super viewWillDisappear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction) showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];

    [timeLabel setText:[formatter stringFromDate:now]];
}

@end
