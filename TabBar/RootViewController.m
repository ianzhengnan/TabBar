//
//  RootViewController.m
//  TabBar
//
//  Created by zhengna on 15/6/26.
//  Copyright (c) 2015 zhengna. All rights reserved.
//

#import "RootViewController.h"
#import "ProfileViewController.h"
#import "MessageViewController.h"
#import "ColaViewController.h"
#import "UserViewController.h"
#import "MoreViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//49 is the size of iphone5, iphone6 is 99
CGFloat const tabViewHeight = 49;
CGFloat const btnWidth = 64;
CGFloat const btnHeight = 45;


@interface RootViewController ()

@property (nonatomic, strong) UIImageView *selectView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES; //hide the default style
    
    [self initViewController];
    
    [self initTabBarView];
}

//initial view controller
- (void)initViewController{
    
    ProfileViewController *profileVC = [[ProfileViewController alloc] init];
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    ColaViewController *colaVC = [[ColaViewController alloc] init];
    UserViewController *userVC = [[UserViewController alloc] init];
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    //store view controllers
    NSArray *vcArray = @[profileVC, messageVC, colaVC, userVC, moreVC];
    //store navigation controllers
    NSMutableArray *tabArray = [[NSMutableArray alloc] initWithCapacity:vcArray.count];
    
    for (int i=0; i < vcArray.count; i++) {
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vcArray[i]];
        [tabArray addObject:navCtrl];
    }
    //assign navigation controllers to tabbar controller
    self.viewControllers = tabArray;
}
//customize tab bar
- (void)initTabBarView{
    //initial tab bar view
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - tabViewHeight, kScreenWidth, tabViewHeight)];
    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mask_navbar"]];
    [self.view addSubview:_tabBarView];
    
    //add a array and get the images
    NSArray *imageArray = @[@"home_tab_icon_1",@"home_tab_icon_2",@"home_tab_icon_3",@"home_tab_icon_4",@"home_tab_icon_5"];
    
    //create buttons
    for (int i = 0; i < imageArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake(btnWidth * i, (tabViewHeight - btnHeight)/2, btnWidth, btnHeight);
        
        //set tag for button, and make sure tag is great than 100 since the number less than 100 has been reserved by system
        btn.tag = 100 + i;
        //add click event for button
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBarView addSubview:btn];
    }
    //initial selected imageview
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    _selectView.image = [UIImage imageNamed:@"home_bottom_tab_arrow"];
    [_tabBarView addSubview:_selectView];
}
#pragma mark - UIButtonAction
- (void)btnAction:(UIButton *)button{
    //get current index by tag value
    self.selectedIndex = button.tag - 100;
    
    //add a animation for selected image
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = button.center;
    } completion:nil];
    
}
//display tabbar or not
- (void)showTabBar:(BOOL)show{
    CGRect frame = self.tabBarView.frame;
    if (show) {
        frame.origin.x = 0;
    }else{
        frame.origin.x = -kScreenWidth;
    }
    //change the fame with a animation
    [UIView animateWithDuration:0.2 animations:^{
        self.tabBarView.frame = frame;
    } completion:nil];
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
