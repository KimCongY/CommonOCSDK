

//
//  CYHomeDataProtocollmpl.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYHomeDataProtocollmpl.h"

@interface CYHomeDataProtocollmpl ()

//广告图片
@property (nonatomic, strong) NSMutableArray * bannerData;


//列表数据
@property (nonatomic, strong) NSMutableArray * listData;



@end


@implementation CYHomeDataProtocollmpl


- (RACSignal *)requestHomeDataSignal:(NSString *)requestUrl{
    
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        
        [subscriber sendNext:self.listData];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
}
- (RACSignal *)requestHomeMoreDataSignal:(NSString *)requestUrl{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        
        [subscriber sendNext:self.listData];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}
- (NSMutableArray *)listData{
    if (!_listData) {
        _listData = [NSMutableArray arrayWithArray:@[@"数据1",@"数据2",@"数据3",@"数据4"]];
    }
    return _listData;
}


@end
