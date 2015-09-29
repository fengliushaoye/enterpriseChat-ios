//
//  AppDelegate+Parse.m
//  enterpriseChat
//
//  Created by dujiepeng on 15/9/29.
//  Copyright © 2015年 easemob. All rights reserved.
//

#import "AppDelegate+Parse.h"
#import <Parse/Parse.h>

@implementation AppDelegate (Parse)
- (void)setupParse{
    [Parse setApplicationId:@"7DLXNCIyH8VEF6viPJpV0UFxF22TuG8X7YYmZl7k"
                  clientKey:@"zXjrAFkCg4kSKkFKFRBl7kV0YEVqK7MQ9SbOugCK"];
}
@end
