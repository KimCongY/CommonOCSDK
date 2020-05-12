//
//  AppDelegate+CYAppServer.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "AppDelegate+CYAppServer.h"
#import "CYTabBarConfig.h"


@implementation AppDelegate (CYAppServer)


#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CYTabBarConfig *tabBarControllerConfig = [[CYTabBarConfig alloc] init];
    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    [self.window setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
}
#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus
{
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType networkStatus) {
        
        switch (networkStatus) {
                // 未知网络
            case PPNetworkStatusUnknown:
                CYLog(@"网络环境：未知网络");
                // 无网络
            case PPNetworkStatusNotReachable:
                CYLog(@"网络环境：无网络");
                break;
                // 手机网络
            case PPNetworkStatusReachableViaWWAN:
                CYLog(@"网络环境：手机自带网络");
                // 无线网络
            case PPNetworkStatusReachableViaWiFi:
                CYLog(@"网络环境：WiFi");
                break;
        }
        
    }];
}
#pragma mark ————— IQKeyboardManager设置 —————
- (void)setIQKeyboardManagerConfig{
    IQKeyboardManager *Keymanager = [IQKeyboardManager sharedManager];
    Keymanager.enable = YES;
    Keymanager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
}

@end
