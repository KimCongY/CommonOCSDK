//
//  CYBaseView.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYBaseView.h"

@interface CYBaseView()


@end

@implementation CYBaseView
- (instancetype)init;
{
    self = [super init];
    if (self) {
        [self cy_bindViewModel];
        [self cy_setupViews];
    }
    return self;
}

- (instancetype)initWithViewModel:(id)viewModel;
{
    self = [super init];
    if (self) {
        [self cy_bindViewModel];
        [self cy_setupViews];
    }
    return self;
}
- (void)cy_setupViews{}
- (void)cy_bindViewModel{}
- (void)cy_addReturnKeyBoard{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
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
