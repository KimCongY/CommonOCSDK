//
//  CYFourViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/14.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYFourViewController.h"
#import "CYFourBtn.h"
@interface CYFourViewController ()
@property (nonatomic, strong) UIButton * imagePositionButton1;
@end

@implementation CYFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    
}
- (void)left_button_event:(UIButton *)sender{
    [CYShowToastView cy_showToastTop:self.view Title:@"点击了返回按钮"];
}
- (void)setUpView{
    
//    CYFourBtn * btn = [[CYFourBtn alloc]initWithFrame:CGRectMake(10, 100, ScreenWidth/5, 70) Title:@"" Image:@""];
//    [self.view addSubview:btn];
    
    
    RACCommand * command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            [subscriber sendCompleted];
            return nil;
        }];
        
    }];
    
    
    
}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 8;
//}
- (void)TablereLoad{
    [self hideRefresh];
}
@end
