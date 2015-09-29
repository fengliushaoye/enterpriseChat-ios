//
//  ECContactsListViewController.m
//  enterpriseChat
//
//  Created by dujiepeng on 15/7/29.
//  Copyright (c) 2015年 easemob. All rights reserved.
//

#import "ECContactsListViewController.h"
#import "ECContactListCell.h"
#import "ECDepartmentListCell.h"
#import "ECDepartmentListViewController.h"
#import "ECDepartmentListManagerViewController.h"
#import "ECContactModel.h"
#import "ECDBManager.h"
@interface ECContactsListViewController () <UITableViewDelegate,UITableViewDataSource>
@end

@implementation ECContactsListViewController

- (instancetype)init{
    if (self = [super init]) {
        [self addNotificationWithName:UPDATEDEPARTMENTLIST
                               action:@selector(updateDatabase)];
    }
    
    return self;
}

- (void)viewDidLoad {
    self.isNeedSearch = YES;
    self.barHiddenWhenSearch = YES;
    [super viewDidLoad];
    [self updateDatabase];
}

-(void)updateDatabase{
    // for test
    [self.datasource removeAllObjects];
    NSArray *departments = [[ECDBManager sharedInstance]
                            loadDepartmentWithLevel:0 loginAccount:@"6001"];
    [self.datasource addObject:departments];
    [self.tableView reloadData];
}

#pragma mark - rewrite superClass
- (UIBarButtonItem *)rightBarButtonItem{
    return [[UIBarButtonItem alloc] initWithTitle:@"test"
                                            style:UIBarButtonItemStyleDone
                                           target:nil
                                           action:nil];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ECDepartmentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ECDepartmentListCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ECDepartmentListCell" bundle:nil]
            forCellReuseIdentifier:@"ECDepartmentListCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ECDepartmentListCell"];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSArray *cellModels = [self.datasource objectAtIndex:[indexPath section]];
        cell.departmentModel = [cellModels objectAtIndex:indexPath.row];
        return cell;
    }else {
        ECContactListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ECContactListCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ECContactListCell" bundle:nil]
            forCellReuseIdentifier:@"ECContactListCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ECContactListCell"];
        }
        NSArray *cellModels = [self.datasource objectAtIndex:[indexPath section]];
        cell.contactModel = [cellModels objectAtIndex:indexPath.row];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray *)[self.datasource objectAtIndex:section]).count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 30;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        label.textColor = [UIColor colorWithWhite:0.333 alpha:0.790];
        label.text = @"最近联系";
        label.font = [UIFont systemFontOfSize:13 weight:2];
        UIView *header = [[UIView alloc] init];
        header.frame = CGRectMake(0, 0, tableView.width, 20);
        header.backgroundColor = [UIColor whiteColor];
        [header addSubview:label];
        return header;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 20;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datasource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        ECDepartmentListManagerViewController *departmentManagerVC = [[ECDepartmentListManagerViewController alloc] init];
          departmentManagerVC.topDepartment = [[self.datasource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:departmentManagerVC animated:YES];
    }else {
        
    }
}

@end
