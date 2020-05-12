//
//  AppDelegate.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "AppDelegate.h"
#import "YYFPSLabel.h"

@interface AppDelegate ()
@property (assign , nonatomic , readwrite) ReachabilityStatus  NetWorkStatus;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化window
    [self initWindow];

    //网络监听
    [self monitorNetworkStatus];
    
    //IQKeyboardManager设置
    [self setIQKeyboardManagerConfig];
    
    // 配置网络状态
    [self configurationNetWorkStatus];
    
    //初始化数据库
    [CYDataManager shareConfig];


    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake(ScreenWidth-80, 15, 50, 30);
    [_fpsLabel sizeToFit];
    [CYApplication.keyWindow addSubview:_fpsLabel];
    
    CYLog(@"测试分支");
    CYLog(@"我是master上面的东西，，，哇哈哈");

    
    return YES;
}
- (void)configurationNetWorkStatus
{
    
    [GLobalRealReachability startNotifier];
    
    RAC(self, NetWorkStatus) = [[[[[NSNotificationCenter defaultCenter]
                                rac_addObserverForName:kRealReachabilityChangedNotification object:nil]
                                  map:^(NSNotification *notification) {
                                      return @([notification.object currentReachabilityStatus]);
                                  }]
                                 startWith:@([GLobalRealReachability currentReachabilityStatus])]
                                distinctUntilChanged];
    
}


@end
