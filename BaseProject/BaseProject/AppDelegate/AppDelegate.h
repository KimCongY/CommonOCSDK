//
//  AppDelegate.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  网络状态
 */
@property (assign , nonatomic , readonly) ReachabilityStatus  NetWorkStatus;

@end

