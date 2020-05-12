


//
//  CYleftBarButton.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYleftBarButton.h"

@implementation CYleftBarButton
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"return"] forState:(UIControlStateNormal)];
        [self setImageEdgeInsets:(UIEdgeInsetsMake(0, -10, 0, 10))];
        [self addTarget:self action:@selector(prcossBack) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return self;
}
- (void)prcossBack
{
    if (    [UIApplication sharedApplication].networkActivityIndicatorVisible) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }
    [[self navigationController] popViewControllerAnimated:YES];
}
-(UINavigationController *)navigationController
{
    for (UIView * next = [self superview] ; next; next = next.superview) {
        UIResponder * nextRes = [next nextResponder];
        if ([nextRes isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController*)nextRes;
        }
    }
    return nil;
}
@end
