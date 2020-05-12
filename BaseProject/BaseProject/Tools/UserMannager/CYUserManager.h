//
//  CYUserManager.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYUserInfomation.h"

@interface CYUserManager : NSObject

//更新或则增加用户的信息，根据primaryKey判断，就是根据CYUserInfomation的id判断
+ (void)addOrUpdateUserinfomation:(CYUserInfomation *)user;

//根据primaryKey查询数据
+ (CYUserInfomation *)QueryUserinfomationPrimaryKey:(NSString *)primaryKey;

//根据primaryKey删除某个对象
+ (void)DeleteUserinfomationprimaryKey:(NSString *)primaryKey;

//删除所有储存对象
+ (void)DeleteAllUserinfomation;
@end
