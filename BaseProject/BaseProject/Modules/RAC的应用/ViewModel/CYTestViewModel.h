//
//  CYTestViewModel.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/6/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYViewModel.h"

@interface CYTestViewModel : CYViewModel

@property (nonatomic,strong) RACCommand * testCommand;

- (void)bindView:(UIView * )view;

@end
