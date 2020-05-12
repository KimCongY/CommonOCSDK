//
//  AppDelegate+CYAppServer.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (CYAppServer)
//初始化 window
-(void)initWindow;

//监听网络状态
- (void)monitorNetworkStatus;

//设置IQKeyboardManager
- (void)setIQKeyboardManagerConfig;

@end
