
//
//  CYHomeView.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/22.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYHomeView.h"
#import "CYHomeViewModel.h"
@interface CYHomeView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) CYHomeViewModel * viewModel;
@property (nonatomic, strong) UITableView * tabview;
@end
@implementation CYHomeView

- (instancetype)initWithViewModel:(id<CYViewModelProtocollmpl>)viewModel{

    self = [super initWithViewModel:viewModel];
    if (self) {
        self.viewModel =(CYHomeViewModel *)viewModel;
    }
    return self;
}
- (void)cy_setupViews{
    [self addSubview:self.tabview];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel.travelDetailCommand execute:@(indexPath.row)];
}
- (UITableView *)tabview
{
    if (!_tabview) {
        _tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-100) style:UITableViewStylePlain];
        _tabview.estimatedRowHeight = 60;
        _tabview.estimatedSectionFooterHeight = 0;
        _tabview.estimatedSectionHeaderHeight = 0;
        _tabview.delegate = self;
        _tabview.dataSource = self;
    }
    return _tabview;
}

@end
