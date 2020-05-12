//
//  CYShowAnimationHud.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYShowAnimationHud : SVProgressHUD

+(void)cy_showProccess:(NSString *)title;

+(void)cy_showProccess;

+(void)cy_showSuccess:(NSString *)title;

+(void)cy_showError:(NSString *)title;

+(void)cy_hideHud;

@end
