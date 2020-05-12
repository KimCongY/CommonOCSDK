


//
//  CYViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYViewController.h"

@interface CYViewController ()

@end

@implementation CYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * push2 = [UIButton buttonWithType:UIButtonTypeCustom];
    push2.frame = CGRectMake(100, 200, 100, 50);
    [push2 setTitle:@"展示图片" forState:UIControlStateNormal];
    [push2 addTarget:self action:@selector(pu2) forControlEvents:UIControlEventTouchUpInside];
    [push2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:push2];


}
- (void)pu2{
    CYImgBrowser * brow = [[CYImgBrowser alloc]initWithimgUrls:@[@"http://ww4.sinaimg.cn/bmiddle/a15bd3a5jw1f12r9ku6wjj20u00mhn22.jpg",@"http://ww2.sinaimg.cn/bmiddle/a15bd3a5jw1f01hkxyjhej20u00jzacj.jpg"] placeholderImgs:@[[UIImageView new],[UIImageView new]] Controller:self.navigationController];
    [brow showImg];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
