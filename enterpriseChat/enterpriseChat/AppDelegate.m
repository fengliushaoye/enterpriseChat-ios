//
//  AppDelegate.m
//  enterpriseChat
//
//  Created by dujiepeng on 15/7/29.
//  Copyright (c) 2015年 easemob. All rights reserved.
//

#import "AppDelegate.h"
#import "ECMainViewController.h"
#import "AppDelegate+EaseMob.h"
#import "AppDelegate+Parse.h"
#import "ECLoginViewController.h"

#import "ECDepartmentModel.h"
#import "ECContactModel.h"
#import "ECDBManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self easemobApplication:application didFinishLaunchingWithOptions:launchOptions];
    [self setupParse];
    [[ECViewManager sharedInstance] setupNavigationBar2White];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginChanged:)
                                                 name:LOGIN_CHANGE_NOTIFICATION
                                               object:nil];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = WINDOW_BACKCOLOR;
    if ([[EaseMob sharedInstance].chatManager isAutoLoginEnabled]) {
        [self showMainView];
    }else {
        [self showLoginView];
    }
    [ECDBManager openEasemobDatabaseWithAccount:@"6001"];
    DLog(@"path -- %@", NSHomeDirectory());
    /*
    // for test

    NSMutableArray *members = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i ++) {
        ECContactModel *contactModel = [[ECContactModel alloc] init];
        contactModel = [[ECContactModel alloc] init];
        contactModel.eid = [NSString stringWithFormat:@"test%d",i];
        contactModel.nickname = [NSString stringWithFormat:@"用户%d",i];
        [members addObject:contactModel.eid];
        [[ECDBManager sharedInstance] insertContact:contactModel loginAccount:@"6001"];
    }
    
    ECDepartmentModel *model = [[ECDepartmentModel alloc] init];
    model.departmentId = @"001";
    model.departmentName = @"环信";
    model.departmentLevel = 0;
    model.deparementMembers = [[NSMutableArray alloc] initWithArray:members];
    model.departmentSubIds = [[NSMutableArray alloc] initWithArray:@[@"002"]];
    model.departmentSupId = @"000";
    model.departmentImagePath = @"www.baidu.com";
    [[ECDBManager sharedInstance] insertDepartment:model loginAccount:@"6001"];
    

    ECDepartmentModel *model1 = [[ECDepartmentModel alloc] init];
    model1.departmentId = @"002";
    model1.departmentName = @"销售部";
    model1.departmentLevel = 1;
    model1.deparementMembers = [[NSMutableArray alloc] initWithArray:@[@"test4",@"tes5",@"test6"]];
    model1.departmentSubIds = [[NSMutableArray alloc] initWithArray:@[@"003",@"004"]];
    model1.departmentSupId = @"001";
    model1.departmentImagePath = @"www.baidu.com";
    [[ECDBManager sharedInstance] insertDepartment:model1 loginAccount:@"6001"];

    
    ECDepartmentModel *model2 = [[ECDepartmentModel alloc] init];
    model2.departmentId = @"003";
    model2.departmentName = @"电话销售部";
    model2.departmentLevel = 3;
    model2.deparementMembers = [[NSMutableArray alloc] initWithArray:@[@"test7",@"test8",@"test9"]];
    model2.departmentSubIds = [[NSMutableArray alloc] initWithArray:@[@"004"]];
    model2.departmentSupId = @"002";
    model2.departmentImagePath = @"www.baidu.com";
    [[ECDBManager sharedInstance] insertDepartment:model2 loginAccount:@"6001"];
    
    
    ECDepartmentModel *model3 = [[ECDepartmentModel alloc] init];
    model3.departmentId = @"004";
    model3.departmentName = @"客服系统电话销售部";
    model3.departmentLevel = 4;
    model3.deparementMembers = [[NSMutableArray alloc] initWithArray:@[@"test7",@"test8",@"test9"]];
    model3.departmentSubIds = [[NSMutableArray alloc] initWithArray:@[@"005",@"006"]];
    model3.departmentSupId = @"003";
    model3.departmentImagePath = @"www.baidu.com";
    [[ECDBManager sharedInstance] insertDepartment:model3 loginAccount:@"6001"];
     */
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)showMainView{
    self.window.rootViewController = [[ECMainViewController alloc] init];
}

- (void)showLoginView{
    self.window.rootViewController = [ECLoginViewController showLoginViewController];
}

- (void)loginChanged:(NSNotification *)noti{
    if ([noti.object boolValue]) {
        [self showMainView];
    }else {
        [self showLoginView];
    }
}

@end
