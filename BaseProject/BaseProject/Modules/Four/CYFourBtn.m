
//
//  CYFourBtn.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/14.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYFourBtn.h"

@implementation CYFourBtn

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Image:(NSString *)url{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView * img = [[UIImageView alloc]init];
        img.image = [UIImage imageNamed:@"自行车"];
        [self addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@45);
            make.top.equalTo(@10);
            make.centerX.equalTo(self);
        }];
        
        UILabel * lab = [[UILabel alloc]init];
        lab.text = @"项目名称";
        lab.textAlignment = 1;
        lab.font = [UIFont systemFontOfSize:13.0f];
        lab.textColor = [UIColor grayColor];
        [self addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img.mas_bottom).offset(0);
            make.left.equalTo(@10);
            make.right.equalTo(@(-10));
            make.centerX.equalTo(self);
        }];

        
        
        
        
    }
    return self;
}

@end
