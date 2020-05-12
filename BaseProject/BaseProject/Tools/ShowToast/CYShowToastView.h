//
//  CYShowToastView.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYShowToastView : NSObject

+ (void)cy_showToastCenter:(UIView *)view Title:(NSString *)title;

+ (void)cy_showToastTop:(UIView *)view Title:(NSString *)title;

+ (void)cy_showToastBottom:(UIView *)view Title:(NSString *)title;

@end
