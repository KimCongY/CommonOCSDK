


//
//  CYViewModelServeicelmpl.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYViewModelServeicelmpl.h"
#import "CYHomeDataProtocollmpl.h"
@interface CYViewModelServeicelmpl()
@property (nonatomic, strong) CYHomeDataProtocollmpl * homeDataServer;
@end

@implementation CYViewModelServeicelmpl


- (instancetype)initModelServerlmpl{
    self = [super init];
    if (self) {
        _homeDataServer = [CYHomeDataProtocollmpl new];
    }
    return self;
}
- (id<CYViewModelProtocollmpl>)getHomeService{
    return self.homeDataServer;
}

- (id<CYViewModelProtocollmpl>)getHomeDetailService {
    return self.homeDataServer;
}

@end
