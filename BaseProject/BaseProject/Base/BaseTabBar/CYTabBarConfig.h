//
//  CYTabBarConfig.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYTabBarConfig : NSObject
@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

@end
