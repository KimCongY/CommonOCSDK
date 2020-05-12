//
//  CYNetwrok.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//


#import "CYNetwrok.h"
@implementation CYNetwrok
static CYNetwrok * _network;
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_network == nil) {
            _network = [super allocWithZone:zone];
            [self openLog];
            [self openNetworkActivityIndicator:YES];//打开状态栏数据加载菊花
            //        [self setValue:@"" forHTTPHeaderField:@""];//设置请求头
        }
    });
    return _network;
}
+(instancetype)sharedConfig
{
    return [[self alloc]init];
}
-(id)copyWithZone:(NSZone *)zone
{
    return _network;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _network;
}

@end
