//
//  ViewController.m
//  HypnoTime
//
//  Created by Craig Bennett on 11/14/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "HypnosisViewController.h"

#import "HypnosisView.h"

@interface HypnosisViewController ()

@end

@implementation HypnosisViewController

- (void) loadView
{
    // Get the tab bair item
    UITabBarItem *tbi = [self tabBarItem];

    // Provide the tab bar with a label
    [tbi setTitle:@"Hypnosis"];

    // Provide the tab bar with an image
    UIImage *i = [UIImage imageNamed:@"Hypno.png"];
    [tbi setImage:i];

    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];

    // Set it as *the* view of the view controller
    [self setView:v];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSLog (@"Hypnosis View loaded");
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
