//
//  CYViewModelProtocollmpl.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CYViewModelProtocollmpl <NSObject>

@optional
//首页数据
- (RACSignal *)requestHomeDataSignal:(NSString *)requestUrl;

//更多数据
- (RACSignal *)requestHomeMoreDataSignal:(NSString *)requestUrl;



@end
