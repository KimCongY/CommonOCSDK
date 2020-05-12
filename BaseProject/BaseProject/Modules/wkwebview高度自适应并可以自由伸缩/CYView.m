//
//  CYView.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/13.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYView.h"

@implementation CYView

- (instancetype)initWithLayout:(MyRelativeLayout *)layout{
    self = [super init];
    if (self) {
        
        _viewLab = [UILabel alloc];
//        _viewLab.text = @"我是view的字体";
//        _viewLab.textColor = [UIColor redColor];
//        _viewLab.wrapContentHeight = YES;
//        _viewLab.topPos.equalTo(@10);
//        _viewLab.leftPos.equalTo(@10);
//        _viewLab.rightPos.equalTo(@10);
//        [layout addSubview:_viewLab];
        
    }
    return self;
}
@end
