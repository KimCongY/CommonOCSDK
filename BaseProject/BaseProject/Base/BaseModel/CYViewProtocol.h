//
//  CYViewProtocol.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CYViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id<CYViewModelProtocollmpl>)viewModel;

- (void)cy_bindViewModel;

- (void)cy_setupViews;

- (void)cy_addReturnKeyBoard;

@end
