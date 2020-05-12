//
//  CYNavgationBarController.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CYNavgationBarControllerDataSource<NSObject>
@optional
-(NSMutableAttributedString*)setTitle;
-(UIButton*)set_leftButton;
-(UIButton*)set_rightButton;
-(UIColor*)set_colorBackground;
-(BOOL)hideNavigationBottomLine;//是否隐藏导航栏底部黑线
-(UIImage*)set_leftBarButtonItemWithImage;
-(UIImage*)set_rightBarButtonItemWithImage;
@end

@protocol CYNavgationBarControllerDelegate<NSObject>
@optional
//点击左边按钮
- (void)left_button_event:(UIButton *)sender;
//点击右边按钮
- (void)right_button_event:(UIButton *)sender;
//点击titleview
-(void)title_click_event:(UIView*)sender;
@end

@interface CYNavgationBarController : UIViewController<CYNavgationBarControllerDelegate,CYNavgationBarControllerDataSource>


@end
