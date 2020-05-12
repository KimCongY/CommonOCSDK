//
//  CYChildViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/14.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYChildViewController.h"
@interface CYChildViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyLinearLayout * layout;
    UILabel * title;
    NSInteger index;

}
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIView * headerView;
@end

@implementation CYChildViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-CYTopHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 60;
//        _tableView.estimatedSectionFooterHeight = 0;
//        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
        _headerView.frame = CGRectMake(0, 0, ScreenWidth, 100);
        _headerView.backgroundColor = [UIColor grayColor];
        _headerView.wrapContentHeight = YES;
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildView];
}
-(NSMutableAttributedString *)setTitle{
    return [self changeTitle:@"点我展开"];
}
- (void)setUpChildView{
    [self.view addSubview:self.tableView];
    
    layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.wrapContentHeight = YES;
    layout.widthSize.equalTo(self.tableView.widthSize);
    layout.padding = UIEdgeInsetsMake(0, 0, 10, 0);
    layout.backgroundColor = [UIColor whiteColor];
    
    title = [[UILabel alloc]init];
    title.text = @"我是标题我是标题我是标题我是标题我是标题";
    title.topPos.equalTo(@10);
    title.leftPos.equalTo(@10);
    title.rightPos.equalTo(@10);
    title.wrapContentHeight = YES;
    [layout addSubview:title];
    
    [layout layoutIfNeeded];
    self.tableView.tableHeaderView = layout;
    
//    [layout sizeToFit];
    
    
    
}
- (void)title_click_event:(UIView *)sender{
    index ++;
    if (index%2==0) {
        title.myVisibility = MyVisibility_Gone;
    }else{
        title.myVisibility = MyVisibility_Visible;
        title.text = @"我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题";
    }
    [UIView animateWithDuration:0.3 animations:^{
        //因为tableHeaderView的特殊情况。如果需要调整tableHeaderView的高度时需要编写如下代码！！！！！
        [self.tableView.tableHeaderView layoutIfNeeded];
        self.tableView.tableHeaderView = self.tableView.tableHeaderView;
    }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 26;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
@end
