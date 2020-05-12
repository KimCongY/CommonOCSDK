//
//  CYBaseChildController.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/14.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYBaseViewController.h"

@protocol CYBaseChildVCDelegate <NSObject>

- (void)CYBaseChildBaseVCScrollViewDidScroll:(UIScrollView *)scrollView;

@end

@interface CYBaseChildController : CYBaseViewController

@property (nonatomic, weak) id<CYBaseChildVCDelegate> delegatBaseeChildVC;

@end
