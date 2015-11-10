//
//  ViewController.m
//  Quiz
//
//  Created by Craig Bennett on 11/9/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Create two arrays and make the pointers point to them
    questions = [NSMutableArray new];
    answers = [NSMutableArray new];

    // Add questions and answers ot the arrays
    [questions addObject:@"What is 7 + 7?"];
    [answers addObject:@"14"];

    [questions addObject:@"What is the capital of Vermont?"];
    [answers addObject:@"Montpelier"];

    [questions addObject:@"From what is cognac made?"];
    [answers addObject:@"Grapes"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) showQuestion: (id)sender
{
    // Step to the next question
    currentQuestionIndex++;

    // Am I past the last question?
    if (currentQuestionIndex == [questions count])
        currentQuestionIndex = 0;

    // Get the string at that index in the questions array
    NSString *question = [questions objectAtIndex:currentQuestionIndex];

    // Log the string to the console
    NSLog (@"Displaying question: %@", question);

    // Display the string in the question field
    [questionField setText:question];

    // Clear the answer field
    [answerField setText:@"???"];

}

- (IBAction) showAnswer: (id)sender
{
    // What is the answer to the current question?
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];

    // Display it in the answer field
    [answerField setText:answer];
}

@end
