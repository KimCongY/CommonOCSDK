//
//  CYEmptyView.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYEmptyView : LYEmptyView

+ (instancetype)NullDataEmpty;

+ (instancetype)NullEmptyActionViewWithTarget:(id)target action:(SEL)action;

@end
