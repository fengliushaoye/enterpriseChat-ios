//
//  ECMainViewController.m
//  enterpriseChat
//
//  Created by dujiepeng on 15/7/29.
//  Copyright (c) 2015年 easemob. All rights reserved.
//

#import "ECMainViewController.h"
#import "ECChatListViewController.h"
#import "ECContactsListViewController.h"
#import "ECEnterpriseListViewController.h"
#import "ECSettingsListViewController.h"
#import "ECNavigationController.h"
#import "ECParseManager.h"

@interface ECMainViewController () <UITabBarControllerDelegate>

@property (nonatomic, strong) ECChatListViewController *chatList;
@property (nonatomic, strong) ECContactsListViewController *friendList;
@property (nonatomic, strong) ECEnterpriseListViewController *enterprise;
@property (nonatomic, strong) ECSettingsListViewController *settings;

@end

@implementation ECMainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self updateDBFromParse];
    [[ECViewManager sharedInstance] setupStatusBarStyle2Default];
    [[ECViewManager sharedInstance] setupNavigationBar2Black];
    self.delegate = self;
    [self setupTabbar];
    self.viewControllers = @[[self setupNavWithVC:self.chatList],
                             [self setupNavWithVC:self.friendList],
                             [self setupNavWithVC:self.enterprise],
                             [self setupNavWithVC:self.settings]];
}

- (void)setupTabbar{
    self.tabBar.tintColor = TABBAR_TINTCOLOR;
    self.tabBar.barTintColor = TABBAR_BARTINTCOLOR;
}

- (void)updateDBFromParse{
    [ECParseManager updateDepartmentsFromParse];
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController{

}


- (ECNavigationController *)setupNavWithVC:(UIViewController *)vc{
    ECNavigationController * ret = [[ECNavigationController alloc] initWithRootViewController:vc];
    ret.title = vc.tabBarItem.title;
    return ret;
}

#pragma mark - getter
- (ECChatListViewController *)chatList{
    if (!_chatList) {
        _chatList = [[ECChatListViewController alloc] init];
        [_chatList setupWithTitle:@"会话"
                finishedSelectedImage:[UIImage imageNamed:@"tabbar_chats"]
          withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_chatsHL"]
                                  tag:0];
    }
    
    return _chatList;
}

- (ECContactsListViewController *)friendList{
    if (!_friendList) {
        _friendList = [[ECContactsListViewController alloc] init];
        [_friendList setupWithTitle:@"联系人"
                  finishedSelectedImage:[UIImage imageNamed:@"tabbar_contacts"]
            withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]
                                    tag:1];
    }
    
    return _friendList;
}

- (ECEnterpriseListViewController *)enterprise{
    if (!_enterprise) {
        _enterprise = [[ECEnterpriseListViewController alloc] init];
        [_enterprise setupWithTitle:@"应用"
                  finishedSelectedImage:[UIImage imageNamed:@"tabbar_social"]
            withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_socialHL"]
                                    tag:2];
    }
    
    return _enterprise;
}

- (ECSettingsListViewController *)settings{
    if (!_settings) {
        _settings = [[ECSettingsListViewController alloc] init];
        [_settings setupWithTitle:@"设置"
                finishedSelectedImage:[UIImage imageNamed:@"tabbar_setting"]
          withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_settingHL"]
                                  tag:3];
    }
    
    return _settings;
}

@end
