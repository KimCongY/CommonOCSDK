//
//  CYUserInfomation.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYUserInfomation : RLMObject
@property NSString * username;
@property NSString * phone;
@property NSString * token;
@property NSString * userid;
@property NSString * tag;//用户唯一标识(通过tag判断用户的唯一性)
@end
