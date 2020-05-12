//
//  CYBaseNavController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYBaseNavController.h"

@interface CYBaseNavController ()

@end

@implementation CYBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
