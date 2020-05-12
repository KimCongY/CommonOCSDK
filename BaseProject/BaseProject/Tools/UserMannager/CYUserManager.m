
//
//  CYUserManager.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYUserManager.h"

@implementation CYUserManager

+ (void)shareConfig{
    // 生成随机秘钥
    NSMutableData *key = [NSMutableData dataWithLength:64];
    RLMRealmConfiguration * config = [RLMRealmConfiguration defaultConfiguration];
    //对文件进行加密
    config.encryptionKey = key;
    //使用默认的目录，但是请将文件名替换为用户名(默认创建一个名为UserData的realm文件)
    config.fileURL =  [[[config.fileURL URLByDeletingLastPathComponent]
                        URLByAppendingPathComponent:@"UserData"]
                       URLByAppendingPathExtension:@"realm"];
    // 将该配置设置为默认 Realm 配置
    [RLMRealmConfiguration setDefaultConfiguration:config];
    CYLog(@"Realm==%@",[RLMRealmConfiguration defaultConfiguration].fileURL);
}
+ (void)addOrUpdateUserinfomation:(CYUserInfomation *)user{
    [self shareConfig];
    RLMRealm * realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addOrUpdateObject:user];
    [realm commitWriteTransaction];
}
+ (CYUserInfomation *)QueryUserinfomationPrimaryKey:(NSString *)primaryKey{
    [self shareConfig];
    RLMRealm * realm = [RLMRealm defaultRealm];
    return [CYUserInfomation objectInRealm:realm forPrimaryKey:primaryKey];
}
+ (void)DeleteUserinfomationprimaryKey:(NSString *)primaryKey;
{
    [self shareConfig];
    RLMRealm * realm = [RLMRealm defaultRealm];
    CYUserInfomation * user = [CYUserInfomation objectInRealm:realm forPrimaryKey:primaryKey];
    if (user == nil) {
        CYLog(@"查询无此用户");
        return;
    }
    [realm beginWriteTransaction];
    [realm deleteObject:user];
    [realm commitWriteTransaction];
    
}
+ (void)DeleteAllUserinfomation;
{
    [self shareConfig];
    RLMRealm * realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];

}
@end
