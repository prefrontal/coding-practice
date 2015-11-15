//
//  ViewController.m
//  Hypnosister
//
//  Created by Craig Bennett on 11/14/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "ViewController.h"

#import "HypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CGRect viewFrame = CGRectMake (160, 240, 100, 150);

    HypnosisView *view = [[HypnosisView alloc] initWithFrame:viewFrame];
    [view setBackgroundColor:[UIColor redColor]];

    [self.view addSubview:view];

    CGRect anotherFrame = CGRectMake (80, 120, 100, 150);

    HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:anotherFrame];
    [anotherView setBackgroundColor:[UIColor blueColor]];

    [self.view addSubview:anotherView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
