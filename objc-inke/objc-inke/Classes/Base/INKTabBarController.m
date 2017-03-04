//
//  INKTabBarController.m
//  objc-inke
//
//  Created by prince.chen on 2017/3/4.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

#import "INKTabBarController.h"
#import "INKTabBar.h"
#import "INKBaseNavViewController.h"

@interface INKTabBarController ()<INKTabBarDelegate>

@property (nonatomic, strong) INKTabBar *inkTabBar;

@end

@implementation INKTabBarController

- (INKTabBar *)inkTabBar {
    if(!_inkTabBar) {
        _inkTabBar = [[INKTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _inkTabBar.delegate = self;
    }
    return _inkTabBar;
}

-(void)tabBar:(INKTabBar *)tabBar clickButton:(INKItemType)idx {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViewControllers];
    
    [self.tabBar addSubview:self.inkTabBar];
    
}

- (void)configViewControllers {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"INKMainViewController", @"INKMeViewController"]];
    
    for (NSInteger i = 0; i < array.count; i++) {
        NSArray *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        INKBaseNavViewController *nav = [[INKBaseNavViewController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = array;
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
