//
//  CYBaseViewController.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYNavgationBarController.h"
@class CYViewModel;
@interface CYBaseViewController : CYNavgationBarController
@property (strong,nonatomic,readonly) CYViewModel * viewModel;
- (instancetype)initWithTitle:(NSString *)title;
-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle;
- (instancetype)initWithViewModel:(CYViewModel *)viewModel;
- (void)bindviewModel;

@property(nonatomic,strong) UITableView *TestTableView;//(测试一下第二种mvvm)
@end
