//
//  CYBaseViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYBaseViewController.h"
#import "CYleftBarButton.h"

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define CHINESE_FONT_NAME  @"Apple SD Gothic Neo"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

@interface CYBaseViewController ()<JPNavigationControllerDelegate>
@property (strong, nonatomic, readwrite) CYViewModel *viewModel;

@end

@implementation CYBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    self.navigationController.jp_interactivePopMaxAllowedInitialDistanceToLeftEdge = 80;
    [self setBackBtn];
    [self bindviewModel];
}
- (instancetype)initWithViewModel:(CYViewModel *)viewModel{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}
- (void)bindviewModel{
//    @weakify(self);
//    [RACObserve(CYAppDelegate, NetWorkStatus) subscribeNext:^(NSNumber *networkStatus) {
//        @strongify(self);
//        if (networkStatus.integerValue == RealStatusNotReachable || networkStatus.integerValue == RealStatusUnknown) {
//            [self.viewModel.requestDataCommand execute:@(RealStatusNotReachable)];
//        }else{
            [self.viewModel.requestDataCommand execute:@1];
//        }
//    }];
}
- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        self.title = title.copy;
    }
    return self;
}
- (void)setBackBtn{
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[CYleftBarButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)]];
}
-(NSMutableAttributedString *)setTitle{
    return [self changeTitle:@"我是标题"];
}
- (void)title_click_event:(UIView *)sender{
    NSLog(@"标题被点击");
}
- (UIButton *)set_leftButton{
    UIButton *left_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [left_button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    return left_button;
}
- (void)right_button_event:(UIButton *)sender{
    NSLog(@"点击右边按钮");
}
- (void)left_button_event:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//是否隐藏导航栏底部黑线(默认不隐藏)
- (BOOL)hideNavigationBottomLine{
    return NO;
}
//设置导航栏背景颜色
- (UIColor *)set_colorBackground{
    return [UIColor whiteColor];
}
- (void)dealloc
{
    NSLog(@"dealloc---%@", self.class);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark 自定义标题样式
-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    return title;
}

-(UITableView *)TestTableView
{
    if (!_TestTableView) {
        _TestTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth, ScreenHeight - CYTopHeight) style:UITableViewStylePlain];
        _TestTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _TestTableView.backgroundColor = [UIColor colorWithRed:0.86 green:0.89 blue:0.91 alpha:1];
#ifdef __IPHONE_11_0
        _TestTableView.estimatedRowHeight = 0;
        _TestTableView.estimatedSectionHeaderHeight = 0;
        _TestTableView.estimatedSectionFooterHeight = 0;
#endif
        [self.view addSubview:_TestTableView];
    }
    return _TestTableView;
}
@end
