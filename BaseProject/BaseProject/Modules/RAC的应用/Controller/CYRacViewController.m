
//
//  CYRacViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYRacViewController.h"
#import "CYHomeViewModel.h"
#import "CYHomeView.h"
#import "CYTestViewModel.h"
@interface CYRacViewController ()
{
    UITableView * tab;
    CYTestViewModel * testVM;
}
@property (assign , nonatomic) BOOL  isSearch;
@property (strong, nonatomic, readonly) CYHomeViewModel *viewModel;
@property (nonatomic, strong) CYHomeView * homeView;
@property (nonatomic, strong) UIButton * sendBtn;
/**
 *  banner图数据
 */
@property (strong, nonatomic) NSMutableArray *bannerData;

@end

@implementation CYRacViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.homeView];
    testVM = [[CYTestViewModel alloc]init];
    [testVM bindView:self.TestTableView];
    
    [[testVM.testCommand executionSignals]subscribeNext:^(id  _Nullable reponse) {
        CYLog(@"reponse == %@",reponse);
        [reponse subscribeNext:^(NSIndexPath * index) {
            CYLog(@"row == %ld",index.row);
        }];
    }];
}
- (void)bindviewModel{
    [super bindviewModel];
    self.isSearch = NO;
//    RAC(self, bannerData) = RACObserve(self.viewModel, bannerData);
//    self.sendBtn.rac_command = self.viewModel.rightBarButtonItemCommand;
//    [[self.viewModel.rightBarButtonItemCommand executionSignals] subscribeNext:^(id  _Nullable x) {
//        [x subscribeNext:^(id  _Nullable x) {
//            NSLog(@"---%@",x);
//        }];
//    }];
//    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:2.0];
//    [[self.viewModel.travelDetailCommand executionSignals]subscribeNext:^(id  _Nullable x) {
//        [x subscribeNext:^(id  _Nullable x) {
//            NSLog(@"点击了---%@",x);
//        }];
//    }];

}
- (void)delayMethod{
    NSLog(@"数据---%@",self.bannerData);
}
- (NSMutableArray *)bannerData{
    if (!_bannerData) {
        _bannerData = [NSMutableArray array];
    }
    return _bannerData;
}
- (CYHomeView *)homeView{
    if (!_homeView) {
        _homeView = [[CYHomeView alloc]initWithViewModel:self.viewModel];
        _homeView.frame = CGRectMake(0, 50, ScreenWidth, ScreenHeight-100);
    }
    return _homeView;
}
- (UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.frame = CGRectMake(100, 0, 100, 50);
        [_sendBtn setTitle:@"绑定" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.view addSubview:_sendBtn];
    }
    return _sendBtn;
}
@end
