

//
//  CYViewModelServeice.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CYViewModelServeice <NSObject>

//获取首页服务
- (id<CYViewModelProtocollmpl>)getHomeService;

//获取首页服务详情
- (id<CYViewModelProtocollmpl>)getHomeDetailService;

@end
