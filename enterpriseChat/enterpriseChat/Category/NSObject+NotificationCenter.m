//
//  NSObject+NotificationCenter.m
//  enterpriseChat
//
//  Created by dujiepeng on 15/9/29.
//  Copyright © 2015年 easemob. All rights reserved.
//

#import "NSObject+NotificationCenter.h"

@implementation NSObject (NotificationCenter)
- (void)addNotificationWithName:(NSString *)name
                        action:(SEL)selector{
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self
                   selector:selector
                       name:name
                     object:nil];
}

- (void)postNotification:(NSString *)name
                  object:(id)object{
    DLog(@"%@", name);
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter postNotificationName:name object:object];
}
@end
