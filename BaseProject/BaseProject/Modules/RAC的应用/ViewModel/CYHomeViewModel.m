


//
//  CYHomeViewModel.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYHomeViewModel.h"

@implementation CYHomeViewModel

- (instancetype)initWithServices:(id<CYViewModelServeice>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        _travelData = [NSArray new];
        _bannerData = [NSArray new];
        _isSearch = NO;
    }
    return self;
}
- (void)initialize{
    [super initialize];
    @weakify(self);
    _travelMoreDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [[[self.servers getHomeDetailService]requestHomeMoreDataSignal:@""]doNext:^(id  _Nullable x) {
            self.travelData = x;
        }];
    }];
    _rightBarButtonItemCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@"我是绑定按钮"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    _travelDetailCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:input];
            [subscriber sendCompleted];
            return nil;
        }];
        return [RACSignal empty];
    }];
    
}
- (RACSignal *)executeRequestSiginal:(id)input{
    if ([input integerValue] == RealStatusNotReachable) {
        self.netWorkStatus = RealStatusNotReachable;
        return [RACSignal empty];
    }else{
        @weakify(self);
        return [[[self.servers getHomeService]requestHomeDataSignal:@""] doNext:^(id  _Nullable x) {
            @strongify(self);
            self.travelData = x;
            self.bannerData = x;
        }];
    }
}
@end
