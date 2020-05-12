//
//  CYNetworkRequest.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYNetworkRequest.h"

static NSString * const data = @"data";//返回数据
static NSString * const resultState = @"resultState";//状态码
static NSString * const msg = @"msg";//返回信息

@implementation CYNetworkRequest

#pragma 公用方法
+ (NSURLSessionTask *)PostUrl:(NSString *)url parameters:(NSDictionary *)parameter Success:(CYRequestSuccess)success Failure:(CYRequestFail)fail{
    [CYNetwrok sharedConfig];
    NSString * postUrl = [NSString stringWithFormat:@"%@%@",HOST_URL,url];
    return [CYNetwrok POST:postUrl parameters:parameter success:^(id responseObject) {
        if ([responseObject[resultState] integerValue] == 1) {
            success(responseObject[data],responseObject[resultState],responseObject[msg]);
        }else{
            
        }
    } failure:^(NSError *error) {
        fail(error);
    }];
}
+ (NSURLSessionTask *)GetUrl:(NSString *)url parameters:(NSDictionary *)parameter Success:(CYRequestSuccess)success Failure:(CYRequestFail)fail{
    [CYNetwrok sharedConfig];
    NSString * gettUrl = [NSString stringWithFormat:@"%@",HOST_URL];
    return [CYNetwrok GET:gettUrl parameters:parameter responseCache:^(id responseCache) {
        //缓存数据
    } success:^(id responseObject) {
//        if ([responseObject[resultState] integerValue] == 1) {
//            success(responseObject[data],responseObject[resultState],responseObject[msg]);
//        }else{
//
//        }
        success(responseObject[data],nil,nil);
    } failure:^(NSError *error) {
        fail(error);
    }];
}
@end
