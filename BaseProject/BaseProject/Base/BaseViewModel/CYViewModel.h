//
//  CYViewModel.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,CYNavBarState) {
    cNavBarStyleNomal   = 0, // 默认
    cNavBarStyleHidden  = 1, // 隐藏
};

@interface CYViewModel : NSObject<CYViewModelProtocollmpl>

@property (nonatomic,strong,readonly) RACCommand * requestDataCommand;

@property (nonatomic,copy,readonly) NSString * title;

@property (nonatomic,assign,readonly) CYNavBarState  navState;

@property (nonatomic,strong,readonly) id<CYViewModelServeice> servers;
/**
 *  网络状态
 */
@property (assign, nonatomic) ReachabilityStatus  netWorkStatus;


- (instancetype)initWithServices:(id<CYViewModelServeice>)services params:(NSDictionary *)params;
- (void)initialize;
- (RACSignal *)executeRequestSiginal:(id)input;
@end
