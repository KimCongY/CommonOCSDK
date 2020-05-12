//
//  CYView.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/13.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYView : UIView
@property (nonatomic, strong) UILabel * viewLab;
- (instancetype)initWithLayout:(MyRelativeLayout *)layout;
@end
