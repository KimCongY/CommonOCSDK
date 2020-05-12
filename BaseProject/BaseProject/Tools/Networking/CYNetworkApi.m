//
//  CYNetworkApi.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYNetworkApi.h"

@implementation CYNetworkApi
+ (NSString *)apitype:(ApiType)type;
{
    switch (type) {
        case ApiHome:
            return @"masterDetailsApi/findMasterInfo.app";
        case ApiMe:
            return @"我的";
        default:
            return @"";
    }
}

@end
