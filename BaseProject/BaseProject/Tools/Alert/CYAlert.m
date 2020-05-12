//
//  CYAlert.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYAlert.h"

@implementation CYAlert
static CYAlert * alert;
- (instancetype)ShareConfig{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!alert) {
            alert = [[self class] alloc];
        }
    });
    return alert;
}
+ (void)alerWithController:(UIViewController *)controller alertWithTitle:(NSString *)title WithMessage:(NSString *)mes Sure:(void(^)(void))surePress Cancel:(void(^)(void))cancelPress{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:mes preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        surePress();
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        cancelPress();
    }];
    [alertController addAction:action];
    [alertController addAction:action1];
    [controller presentViewController:alertController animated:YES completion:nil];
}
@end
