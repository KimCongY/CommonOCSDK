
//
//  CYUserInfomation.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYUserInfomation.h"

@implementation CYUserInfomation

+ (NSString *)primaryKey{//确保唯一性
    return @"tag";
}
//设置默认值
+ (NSDictionary *)defaultPropertyValues{
    return @{@"username":@"",@"phone":@"",@"token":@"",@"userid":@""};
}

@end
