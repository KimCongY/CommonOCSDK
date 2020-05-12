//
//  CYBaseChildController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/14.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYBaseChildController.h"

@interface CYBaseChildController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation CYBaseChildController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pageTitleViewToTop) name:@"pageTitleViewToTop" object:nil];
    
}
- (void)pageTitleViewToTop {
    _scrollView.contentOffset = CGPointZero;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = scrollView;
    }
    if (self.delegatBaseeChildVC && [self.delegatBaseeChildVC respondsToSelector:@selector(CYBaseChildBaseVCScrollViewDidScroll:)]) {
        [self.delegatBaseeChildVC CYBaseChildBaseVCScrollViewDidScroll:scrollView];
    }
}

@end
