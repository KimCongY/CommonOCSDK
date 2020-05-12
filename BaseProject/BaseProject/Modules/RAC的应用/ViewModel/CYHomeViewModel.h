//
//  CYHomeViewModel.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYHomeViewModel : CYViewModel

/**
 *  错误信号
 */
@property (strong, nonatomic) RACSignal *travelConnectionErrors;
/**
 *  更多数据请求
 */
@property (strong, nonatomic) RACCommand *travelMoreDataCommand;
/**
 *  更多错误信号
 */
@property (strong, nonatomic) RACSignal *travelMoreConnectionErrors;
/**
 *  导航栏rightBar
 */
@property (strong, nonatomic) RACCommand *rightBarButtonItemCommand;
/**
 *  游记详情
 */
@property (strong, nonatomic) RACCommand *travelDetailCommand;
/**
 *  游记数据
 */
@property (strong, nonatomic) NSArray *travelData;
/**
 *  banner数据
 */
@property (strong, nonatomic) NSArray *bannerData;
/**
 *  是否为搜索
 */
@property (assign , nonatomic) BOOL  isSearch;


@end
