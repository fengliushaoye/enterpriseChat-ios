//
//  enterpriseDefine.h
//  enterpriseChat
//
//  Created by dujiepeng on 15/7/29.
//  Copyright (c) 2015年 easemob. All rights reserved.
//

#ifndef enterpriseChat_enterpriseDefine_h
#define enterpriseChat_enterpriseDefine_h


#if DEBUG
#ifndef DLog
#define DLog(format, args...) \
NSLog(@"[%s  line : %d]: " format "\n", __PRETTY_FUNCTION__, __LINE__, ## args);
//          NSLog(@"%s %s, line %d: " format "\n",__PRETTY_FUNCTION__, __func__, __LINE__, ## args);
#endif
#else
#ifndef DLog
#define DLog(format, args...) do {} while(0)
#endif
#endif


#define LOGIN_CHANGE_NOTIFICATION @"loginChange"

// window
#define WINDOW_BACKCOLOR [UIColor whiteColor]

// tab
#define TABBAR_TINTCOLOR [UIColor colorWithRed: 0 green: 0 blue: 1 alpha: 0.6]
#define TABBAR_BARTINTCOLOR [UIColor whiteColor]
#define TABBAR_TEXT_FONT_SIZE 10
#define TABBAR_NORMAL_TEXT_COLOR [UIColor darkGrayColor]
#define TABBAR_SELECTED_TEXT_COLOR TABBAR_TINTCOLOR

// nav
// navbar 背景色
#define NAVIGATIONBAR_TINTCOLOR [UIColor colorWithRed: 0.1349 green: 0.1517 blue: 0.1623 alpha: 1.0]

// navbar 字体大小
#define NAVTITLE_FONT_SIZE 16

// cell
// cell line color
#define ECCELL_LINE [UIColor colorWithWhite:0.667 alpha:0.610]


// Parse DEPARTMENT
#define DEPARTMENT              @"DEPARTMENT"
#define DEPARTMENTID            @"departmentId"
#define DEPARTMENTNAME          @"departmentName"
#define DEPARTMENTHEADPATH      @"departmentHeadPath"
#define DEPARTMENTMEMBERS       @"departmentMembers"
#define DEPARTMENTSUBIDS        @"departmentSubIds"
#define DEPARTMENTSUPID         @"departmentSupId"
#define DEPARTMENTLEVEL         @"departmentLevel"
#endif
