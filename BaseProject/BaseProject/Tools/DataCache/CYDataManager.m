//
//  CYDataManager.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/29.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYDataManager.h"
#import <BGFMDB.h>

#define Sqlite_Name @"CYDataSource"//数据名称

@implementation CYDataManager
+ (instancetype)shareConfig{
    static CYDataManager * manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CYDataManager alloc]init];
        bg_setSqliteName(Sqlite_Name);
        bg_setDebug(YES);
        //如果频繁操作数据库时,建议进行此设置(即在操作过程不关闭数据库);
        bg_setDisableCloseDB(YES);
        NSLog(@"沙盒:%@",NSHomeDirectory());
    });
    return manager;
}

+ (void)Cy_SaveArray:(NSArray *)array ArrrayWithTagName:(NSString *)Tagname;
{
    NSArray * dataArr = array;
    [dataArr bg_saveArrayWithName:Tagname];
}

+ (void)Cy_ArrayAddObj:(id)data ArrrayWithTagName:(NSString *)Tagname;
{
    [NSArray bg_addObjectWithName:Tagname object:data];
}

+ (void)Cy_UpdataArrayTagname:(NSString *)Tagname Obj:(id)data Index:(NSInteger)index;
{
    [NSArray bg_updateObjectWithName:Tagname Object:data Index:index];
}

+ (void)Cy_DeleteArrayTagname:(NSString *)Tagname Index:(NSInteger)index;
{
    [NSArray bg_deleteObjectWithName:Tagname Index:index];
}

+ (id)Cy_ArrayWithTagname:(NSString *)Tagname Index:(NSInteger)index;
{
    return [NSArray bg_objectWithName:Tagname Index:index];
}

+ (NSArray *)Cy_ArrayWithTagname:(NSString *)Tagname;
{
    return [NSArray bg_arrayWithName:Tagname];
}

+ (void)Cy_ClearArrayWithTagname:(NSString *)Tagname;
{
    [NSArray bg_clearArrayWithName:Tagname];
}
@end
