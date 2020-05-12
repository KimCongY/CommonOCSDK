//
//  CYTabview.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/14.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYTabview.h"

@implementation CYTabview

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

@end
