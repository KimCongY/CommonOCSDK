
//
//  CYViewModel.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYViewModel.h"

@interface CYViewModel()
@property (nonatomic,strong,readwrite) id<CYViewModelServeice> servers;
@property (nonatomic,strong,readwrite) RACCommand * requestDataCommand;
@property (nonatomic,assign,readwrite) CYNavBarState  navState;
@property (nonatomic,copy,readwrite) NSString * title;
@end

@implementation CYViewModel

- (instancetype)initWithServices:(id<CYViewModelServeice>)services params:(NSDictionary *)params;
{
    self = [super init];
    if (self) {
        self.servers = services;
        @weakify(self);
        self.requestDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [[self executeRequestSiginal:input] takeUntil:self.rac_willDeallocSignal];
        }];
        [self initialize];
    }
    return self;
}
- (void)initialize{}
- (RACSignal *)executeRequestSiginal:(id)input{
    return [RACSignal empty];
}
@end
