//
//  CYOneViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYOneViewController.h"
#import "CYViewController.h"
#import "CYChildTwoViewController.h"
#import "CYImgPickerController.h"
#import "CYDataViewController.h"
#import "CYAsyncKitControllerViewController.h"
@interface CYOneViewController ()

@end

@implementation CYOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    self.navigationItem.leftBarButtonItem = nil;
    
    UIButton * push = [UIButton buttonWithType:UIButtonTypeCustom];
    push.frame = CGRectMake(100, 100, 100, 50);
    [push setTitle:@"图片浏览" forState:UIControlStateNormal];
    [push addTarget:self action:@selector(pu) forControlEvents:UIControlEventTouchUpInside];
    [push setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:push];
    
    UIButton * push22 = [UIButton buttonWithType:UIButtonTypeCustom];
    push22.frame = CGRectMake(200, 100, 100, 50);
    [push22 setTitle:@"AsyncDis" forState:UIControlStateNormal];
    [push22 addTarget:self action:@selector(pu22) forControlEvents:UIControlEventTouchUpInside];
    [push22 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:push22];
    
    UIButton * push2 = [UIButton buttonWithType:UIButtonTypeCustom];
    push2.frame = CGRectMake(100, 200, 150, 50);
    [push2 setTitle:@"微博表头展开" forState:UIControlStateNormal];
    [push2 addTarget:self action:@selector(pu2) forControlEvents:UIControlEventTouchUpInside];
    [push2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:push2];
    
    UIButton * push3 = [UIButton buttonWithType:UIButtonTypeCustom];
    push3.frame = CGRectMake(100, 300, 100, 50);
    [push3 setTitle:@"相册选择" forState:UIControlStateNormal];
    [push3 addTarget:self action:@selector(pu3) forControlEvents:UIControlEventTouchUpInside];
    [push3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:push3];
    
    UIButton * push4 = [UIButton buttonWithType:UIButtonTypeCustom];
    push4.frame = CGRectMake(100, 400, 100, 50);
    [push4 setTitle:@"数据存储" forState:UIControlStateNormal];
    [push4 addTarget:self action:@selector(pu4) forControlEvents:UIControlEventTouchUpInside];
    [push4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:push4];


    

}
- (void)title_click_event:(UIView *)sender{
    [CYShowToastView cy_showToastCenter:self.view Title:@"点击了标题"];
}
- (void)pu{
    CYViewController * two = [CYViewController new];
    two.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:two animated:YES];
}
- (void)pu2{
    CYChildTwoViewController * two = [CYChildTwoViewController new];
    two.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:two animated:YES];
}
- (void)pu3{
    CYImgPickerController * two = [CYImgPickerController new];
    two.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:two animated:YES];
}
- (void)pu4{
    CYDataViewController * two = [CYDataViewController new];
    two.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:two animated:YES];
}
- (void)pu22{
    CYAsyncKitControllerViewController * as = [[CYAsyncKitControllerViewController alloc]init];
    as.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:as animated:YES];
}


@end
