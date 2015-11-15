//
//  ViewController.m
//  Hypnosister
//
//  Created by Craig Bennett on 11/14/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize firstHypnosisView;

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CGRect screenRect = [self.view bounds];

    // Create a UIScrollView that is the size of the screen
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [scrollView setMinimumZoomScale:1.0];
    [scrollView setMaximumZoomScale:5.0];
    [scrollView setDelegate:self];
    
    [self.view addSubview:scrollView];

    // Add the first HypnosisView as a subview of the scrollView
    firstHypnosisView = [[HypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:firstHypnosisView];

    // Tell the scrollView how big its virtual view is
    CGRect bigRect = screenRect;
    [scrollView setContentSize:bigRect.size];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark First Responder Actions

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog (@"Device started shaking!");
        [firstHypnosisView setCircleColor:[UIColor redColor]];
    }
}

#pragma mark UIScrollViewDelegate Methods

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.view;
}

@end
