//
//  CYNetworkRequest.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYNetwrok.h"

typedef void(^CYRequestSuccess)(id response,NSString * resultState,NSString * msg);

typedef void(^CYRequestFail)(NSError * error);

@interface CYNetworkRequest : NSObject

+ (NSURLSessionTask *)PostUrl:(NSString *)url parameters:(NSDictionary *)parameter Success:(CYRequestSuccess)success Failure:(CYRequestFail)fail;

+ (NSURLSessionTask *)GetUrl:(NSString *)url parameters:(NSDictionary *)parameter Success:(CYRequestSuccess)success Failure:(CYRequestFail)fail;

@end
