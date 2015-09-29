//
//  ECParseManager.m
//  enterpriseChat
//
//  Created by dujiepeng on 15/9/29.
//  Copyright © 2015年 easemob. All rights reserved.
//

#import "ECParseManager.h"
#import "ECDBManager.h"
#import "ECDepartmentModel.h"
@implementation ECParseManager
// 更新department

+ (ECParseManager *)sharedInstance{
    static dispatch_once_t onceToken;
    static ECParseManager *ret = nil;
    dispatch_once(&onceToken, ^{
        ret = [[ECParseManager alloc] init];
    });
    
    return ret;
}


+ (void)updateDepartmentsFromParse{
    ECParseManager *pm = [ECParseManager sharedInstance];
    [pm updateDepartmentsFromParse];
}

- (void)updateDepartmentsFromParse{
    PFQuery *query = [PFQuery queryWithClassName:DEPARTMENT];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            for (id object in objects) {
                if ([object isKindOfClass:[PFObject class]]) {
                    PFObject *deparment = (PFObject *)object;
                    [[ECDBManager sharedInstance] insertDepartment:[self departmentPFObject2ECDepartment:deparment]
                                                      loginAccount:@"6001"];
                }
            }
            [self postNotification:UPDATEDEPARTMENTLIST object:nil];
        }
    }];

}

-(ECDepartmentModel *)departmentPFObject2ECDepartment:(PFObject *)departmentPFObject{
    ECDepartmentModel *ret = [[ECDepartmentModel alloc] init];
    ret.departmentId = departmentPFObject[DEPARTMENTID];
    ret.departmentName = departmentPFObject[DEPARTMENTNAME];
    ret.departmentSupId = departmentPFObject[DEPARTMENTSUPID];
    ret.departmentImagePath = departmentPFObject[DEPARTMENTHEADPATH];
    ret.departmentLevel = [departmentPFObject[DEPARTMENTLEVEL] integerValue];
    NSMutableArray *members = [[departmentPFObject[DEPARTMENTMEMBERS] componentsSeparatedByString:@"_"] mutableCopy];
    ret.deparementMembers = members;
    NSMutableArray *subIds = [[departmentPFObject[DEPARTMENTSUBIDS]
                              componentsSeparatedByString:@"_"] mutableCopy];
    
    ret.departmentSubIds = subIds;
    return ret;
}
@end
