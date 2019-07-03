//
//  User.h
//  twitter
//
//  Created by arleneigwe on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

//properties for the user class
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;

//intializer that sets properties using dictionary
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
