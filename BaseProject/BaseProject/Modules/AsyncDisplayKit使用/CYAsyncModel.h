//
//  CYAsyncModel.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/12.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYAsyncModel : NSObject
@property (nonatomic,copy) NSString * desc;
@property (nonatomic,copy) NSString * image_url;
@property (nonatomic,copy) NSString * abs;
@property (nonatomic,copy) NSString * colum;
@property (nonatomic,assign) BOOL isOpen;//是否展开
@end
