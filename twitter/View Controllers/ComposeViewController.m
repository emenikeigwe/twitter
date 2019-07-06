//
//  ComposeViewController.m
//  twitter
//
//  Created by arleneigwe on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "TimelineViewController.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)closeAction:(id)sender {
    //close view controller
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)tweetAction:(id)sender {
    NSString *tweet_text = self.composeTweet.text;
    // Get timeline --> make an API request
    [[APIManager shared]postStatusWithText:tweet_text completion:^(Tweet *tweet, NSError *error) {
        //receiving tweet data failed
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        //receiving tweet data succeeded
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
        }
    }];
    //close view controller
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
