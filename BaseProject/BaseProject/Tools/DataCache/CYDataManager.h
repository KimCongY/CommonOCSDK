//
//  CYDataManager.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/29.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYDataManager : NSObject

+ (instancetype)shareConfig;

/**
 存储数组(根据标识存储)
 
 @param array 储存的数组
 @param Tagname 数组唯一标识
 */
+ (void)Cy_SaveArray:(NSArray *)array ArrrayWithTagName:(NSString *)Tagname;

/**
 往数组上追加数据

 @param data 追加的数据
 @param Tagname 数组唯一标识
 */
+ (void)Cy_ArrayAddObj:(id)data ArrrayWithTagName:(NSString *)Tagname;


/**
 更新数组上的数据

 @param Tagname 数组唯一标识
 @param data 新更新的数据
 @param index 数组索引
 */
+ (void)Cy_UpdataArrayTagname:(NSString *)Tagname Obj:(id)data Index:(NSInteger)index;


/**
 删除数组上的某一个值

 @param Tagname 数组唯一标识
 @param index 数组索引
 */
+ (void)Cy_DeleteArrayTagname:(NSString *)Tagname Index:(NSInteger)index;


/**
 查询数组上的某一个值

 @param Tagname 数组唯一标识
 @param index 数组索引
 @return 查询结果
 */
+ (id)Cy_ArrayWithTagname:(NSString *)Tagname Index:(NSInteger)index;

/**
 查询数组

 @param Tagname 数组唯一标识
 @return 查询结果
 */
+ (NSArray *)Cy_ArrayWithTagname:(NSString *)Tagname;


/**
 清除数组

 @param Tagname 数组唯一标识
 */
+ (void)Cy_ClearArrayWithTagname:(NSString *)Tagname;

@end
