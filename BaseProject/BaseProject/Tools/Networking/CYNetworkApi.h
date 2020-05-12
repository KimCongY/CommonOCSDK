//
//  CYNetworkApi.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,ApiType){
    ApiHome,
    ApiMe
};
@interface CYNetworkApi : NSObject

@property (nonatomic,assign)ApiType apitype;


+ (NSString *)apitype:(ApiType)type;


@end
