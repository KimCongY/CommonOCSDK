//
//  CYShowToastView.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYShowToastView.h"

@implementation CYShowToastView

+ (void)cy_showToastCenter:(UIView *)view Title:(NSString *)title
{
    [view makeToast:title duration:2 position:CSToastPositionCenter];
}
+ (void)cy_showToastTop:(UIView *)view Title:(NSString *)title
{
    [view makeToast:title duration:2 position:CSToastPositionTop];
}
+ (void)cy_showToastBottom:(UIView *)view Title:(NSString *)title
{
    [view makeToast:title duration:2 position:CSToastPositionBottom];
}
@end
