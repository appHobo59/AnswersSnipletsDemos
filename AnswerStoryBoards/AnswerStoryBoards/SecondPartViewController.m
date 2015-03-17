//
//  SecondPartViewController.m
//  AnswerStoryBoards
//
//  Created by Wylene Sweeney on 2/4/15.
//  Copyright (c) 2015 techENABLE, Inc. All rights reserved.
//

#import "SecondPartViewController.h"
#import "NSString+ReverseString.h"

@interface SecondPartViewController ()

@end

@implementation SecondPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *newLabelText = _mirrorImageLabel.text;
    /*!
     * @brief This calls the NSString category to 
     * reverse the string for a mirror image look
     */
    _mirrorImageLabel.text = [newLabelText reverseString:newLabelText];
    
    /*! 
     * @brief This shows an NSLog console solution to Jeff Atwood's FizzBuzz
     * Simple solution took approximately 2 minutes
     */
    int i;
    for (i=1; i<= 100; i++) {
        
        if (i % 3*5 == 0){
            NSLog(@"FizzBuzz\n");
        }else if (i % 5 == 0){
            NSLog(@"Buzz\n");
        }else if (i % 3 == 0){
            NSLog (@"Fizz\n");
        } //Default
        
        NSLog(@"%i\n",i);
        
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)returnToMain:(id)sender {
    
    //02042015 updated for iOS 8
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
