//
//  CYAlert.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYAlert : NSObject
+ (void)alerWithController:(UIViewController *)controller alertWithTitle:(NSString *)title WithMessage:(NSString *)mes Sure:(void(^)(void))surePress Cancel:(void(^)(void))cancelPress;
@end
