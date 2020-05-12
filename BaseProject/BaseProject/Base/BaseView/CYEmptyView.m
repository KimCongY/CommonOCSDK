
//
//  CYEmptyView.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYEmptyView.h"

@implementation CYEmptyView

+ (instancetype)NullDataEmpty{
    return [CYEmptyView emptyViewWithImageStr:@""//占位图片
                                     titleStr:@"暂无数据"
                                    detailStr:@"请检查你的网络设置"];
}
+ (instancetype)NullEmptyActionViewWithTarget:(id)target action:(SEL)action;
{
    return [CYEmptyView emptyActionViewWithImageStr:@"noNetwork"//占位图片
                                             titleStr:@"无网络连接"
                                            detailStr:@"请检查你的网络连接是否正确!"
                                          btnTitleStr:@"重新加载"
                                               target:target
                                               action:action];
}
- (void)prepare{//重写父类方法，设置字体颜色等样式
    [super prepare];
    
//    self.titleLabFont = [UIFont systemFontOfSize:25];
//    self.titleLabTextColor = [UIColor redColor];
//
//    self.detailLabFont = [UIFont systemFontOfSize:17];
//    self.detailLabTextColor = [UIColor redColor];
//    self.detailLabMaxLines = 5;
//
//    self.actionBtnBackGroundColor = MainColor(90, 180, 160);
//    self.actionBtnTitleColor = [UIColor whiteColor];
    
}
@end
