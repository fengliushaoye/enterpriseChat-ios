//
//  ECContactModel.m
//  enterpriseChat
//
//  Created by dujiepeng on 15/8/25.
//  Copyright (c) 2015年 easemob. All rights reserved.
//

#import "ECContactModel.h"

@implementation ECContactModel

- (NSString *)showName{
    return self.nickname?self.nickname:self.eid;
}

- (NSString *)searchKey{
    return [self showName];
}

@end
