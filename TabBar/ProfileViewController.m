//
//  ProfileViewController.m
//  TabBar
//
//  Created by zhengna on 15/6/26.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ProfileViewController.h"
#import "ModelViewController.h"
#import "PushViewController.h"
#import "RootViewController.h"

CGFloat const writeButtonWidth = 33;
CGFloat const writeButtonHeight = 32;

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self initNavButton];
    [self initPushButton];
}
//customize navigation bar button
- (void)initNavButton{

    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    writeBtn.frame = CGRectMake(0, 0, writeButtonWidth, writeButtonHeight);
    [writeBtn setBackgroundImage:[UIImage imageNamed:@"write"] forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    //add the btn to navigation bar
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:writeBtn];
    self.navigationItem.leftBarButtonItem = item;
}

//customize push button
- (void)initPushButton{
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    pushButton.frame = CGRectMake(100, 200, 200, 40);
    //[pushButton setImage:<#(UIImage *)#> forState:<#(UIControlState)#>]
    //title and image cannot appear together
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushButton];
    
}

- (void)pushAction{
    //push方式，从导航控制器出发，返回方式是pop
    PushViewController *pushVC = [[PushViewController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    
    [rootVC showTabBar:NO];
    
    // the new method to show view controller
    //[self.navigationController showViewController:<#(UIViewController *)#> sender:<#(id)#>]
}

//invoked when view appear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    [rootVC showTabBar:YES];
}

- (void)presentAction{

    ModelViewController *modelVC = [[ModelViewController alloc] init];
    //模态视图的方式， 从视图控制器出发，返回方式是dismiss
    [self presentViewController:modelVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
