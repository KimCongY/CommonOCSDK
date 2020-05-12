//
//  Common.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#ifndef Common_h
#define Common_h

//获取系统对象
#define CYApplication        [UIApplication sharedApplication]
#define CYAppWindow          [UIApplication sharedApplication].delegate.window
#define CYAppDelegate        ((AppDelegate*)[UIApplication sharedApplication].delegate)
#define CYRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define CYUserDefaults       [NSUserDefaults standardUserDefaults]
#define CYNotificationCenter [NSNotificationCenter defaultCenter]


#define CYStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height//状态栏高度
#define CYNavBarHeight 44.0//导航栏高度
#define CYTopHeight (CYStatusBarHeight + CYNavBarHeight)//状态栏高度和导航栏一起的高度


#define RGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width


//弱引用
#define CYWeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;


// ***** log *****//
#ifdef DEBUG
#define CYLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define CYLog(...)
#endif




#endif /* Common_h */
