//
//  NSObject+NotificationCenter.h
//  enterpriseChat
//
//  Created by dujiepeng on 15/9/29.
//  Copyright © 2015年 easemob. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UPDATEDEPARTMENTLIST        @"updateDepartmentList"
#define UPDATEDEPARTMENT            @"updateDepartment"
#define UPDATECONTACTLIST           @"updateContactList"
#define UPDATECONTACT               @"updateContact"

@interface NSObject (NotificationCenter)
- (void)addNotificationWithName:(NSString *)name
                        action:(SEL)selector;
- (void)postNotification:(NSString *)name
                  object:(id)object;
@end
