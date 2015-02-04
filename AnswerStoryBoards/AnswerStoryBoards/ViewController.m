//
//  ViewController.m
//  AnswerStoryBoards
//
//  Created by Wylene Sweeney on 2/4/15.
//  Copyright (c) 2015 techENABLE, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToSecond:(id)sender {
   
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"SecondStoryboard" bundle:nil];
    UIViewController *secondPartVC = [secondStoryboard instantiateInitialViewController];
    
    //02042015 To go to another, you would instantiateViewControllerWithIdentifier: @"anyOtherVCbyName"
    //UIViewController *anyOtherVC = [secondStoryboard instantiateViewControllerWithIdentifier:<#(NSString *)#>];
    secondPartVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //02042015 updated for iOS 8
    [self presentViewController:secondPartVC animated:YES completion:nil];
    
}
@end
