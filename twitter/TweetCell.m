//
//  TweetCell.m
//  twitter
//
//  Created by arleneigwe on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

static NSString * const beforeLike = @"favor-icon";
static NSString * const afterLike = @"favor-icon-red";
static NSString * const reply = @"reply-icon";
static NSString * const beforeRetweet = @"retweet-icon";
static NSString * const afterRetweet = @"retweet-icon-green";

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapLike:(id)sender {
    self.tweets.favorited = !(self.tweets.favorited);
    if (self.tweets.favorited){
        self.tweets.favoriteCount += 1;
        [self.likeButton setImage:[UIImage imageNamed:afterLike] forState:UIControlStateNormal];
        [[APIManager shared] favorite:self.tweets completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweets.favoriteCount -= 1;
        [self.likeButton setImage:[UIImage imageNamed:beforeLike] forState:UIControlStateNormal];
        [[APIManager shared] unfavorite:self.tweets completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    
}

- (IBAction)didTapRetweet:(id)sender {
    self.tweets.retweeted = !(self.tweets.retweeted);
    if (self.tweets.retweeted){
        self.tweets.retweetCount += 1;
        [self.retweetButton setImage:[UIImage imageNamed:afterRetweet] forState:UIControlStateNormal];
        [[APIManager shared] retweet:self.tweets completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweets.retweetCount -= 1;
        [self.retweetButton setImage:[UIImage imageNamed:beforeRetweet] forState:UIControlStateNormal];
        [[APIManager shared] unretweet:self.tweets completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
}

@end
