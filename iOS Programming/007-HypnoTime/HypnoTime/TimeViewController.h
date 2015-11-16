//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Craig Bennett on 11/15/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
{
    __weak IBOutlet UILabel *timeLabel;
}

- (IBAction) showCurrentTime:(id)sender;

@end
