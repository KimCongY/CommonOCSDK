//
//  CYShowAnimationHud.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYShowAnimationHud.h"

@implementation CYShowAnimationHud

+(void)cy_showProccess:(NSString *)title{
    [CYShowAnimationHud setDefaultStyle:SVProgressHUDStyleDark];
    [CYShowAnimationHud setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [CYShowAnimationHud setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [CYShowAnimationHud dismissWithDelay:20];
    [CYShowAnimationHud showWithStatus:[NSString stringWithFormat:@"  %@  ",title]];
}
+(void)cy_showProccess{
    [CYShowAnimationHud setDefaultStyle:SVProgressHUDStyleDark];
    [CYShowAnimationHud setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [CYShowAnimationHud setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [CYShowAnimationHud dismissWithDelay:20];
    [CYShowAnimationHud showWithStatus:nil];
}
+(void)cy_showSuccess:(NSString *)title{
    [CYShowAnimationHud setDefaultStyle:SVProgressHUDStyleDark];
    [CYShowAnimationHud dismissWithDelay:3];
    [CYShowAnimationHud showSuccessWithStatus:[NSString stringWithFormat:@"  %@  ",title]];
}
+(void)cy_showError:(NSString *)title{
    [CYShowAnimationHud setDefaultStyle:SVProgressHUDStyleDark];
    [CYShowAnimationHud dismissWithDelay:3];
    [CYShowAnimationHud showErrorWithStatus:[NSString stringWithFormat:@"  %@  ",title]];
}
+(void)cy_hideHud{
    [CYShowAnimationHud dismiss];
}
@end
