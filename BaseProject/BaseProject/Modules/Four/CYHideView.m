

//
//  CYHideView.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYHideView.h"
@implementation CYHideView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}
- (void)setUpView{
    NSArray * imgArr = @[@"棒球",@"保龄球",@"冰壶",@"帆船",@"橄榄球",@"高尔夫",@"国际象棋",@"滑冰",@"帽子",@"乒乓球"];
    NSArray * titleArr = @[@"棒球",@"保龄球",@"冰壶",@"帆船",@"橄榄球",@"高尔夫",@"国际象棋",@"滑冰",@"帽子",@"乒乓球"];
}
@end
