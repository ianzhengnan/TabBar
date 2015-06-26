//
//  RootViewController.h
//  TabBar
//
//  Created by zhengna on 15/6/26.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITabBarController

@property (nonatomic, strong) UIView *tabBarView;

- (void)showTabBar: (BOOL)show;


@end
