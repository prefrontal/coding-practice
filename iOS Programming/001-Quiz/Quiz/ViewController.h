//
//  ViewController.h
//  Quiz
//
//  Created by Craig Bennett on 11/9/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int currentQuestionIndex;

    // The Model Objects
    NSMutableArray *questions;
    NSMutableArray *answers;

    // The view objects
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

- (IBAction) showQuestion: (id)sender;
- (IBAction) showAnswer: (id)sender;

@end

