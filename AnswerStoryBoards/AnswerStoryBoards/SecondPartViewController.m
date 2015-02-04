//
//  SecondPartViewController.m
//  AnswerStoryBoards
//
//  Created by Wylene Sweeney on 2/4/15.
//  Copyright (c) 2015 techENABLE, Inc. All rights reserved.
//

#import "SecondPartViewController.h"

@interface SecondPartViewController ()

@end

@implementation SecondPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
