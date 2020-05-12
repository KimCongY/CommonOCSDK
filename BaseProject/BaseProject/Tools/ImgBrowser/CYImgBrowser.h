//
//  CYImgBrowser.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYImgBrowser : NSObject

/**
 初始化

 @param urls 网络图片地址
 @param imgs 占位图片UIImageView(必传,不然取值会Crash)
 @param controller 当前控制器
 @return self
 */
- (instancetype)initWithimgUrls:(NSArray *)urls placeholderImgs:(NSArray<UIImageView *> *)imgs Controller:(UIViewController *)controller;

- (void)showImg;

@end
