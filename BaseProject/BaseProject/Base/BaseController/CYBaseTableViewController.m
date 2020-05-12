//
//  CYBaseTableViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYBaseTableViewController.h"

@interface CYBaseTableViewController ()
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@end

@implementation CYBaseTableViewController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseTableViewUI];
    
}
- (void)setupBaseTableViewUI
{
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.tableView.backgroundColor = self.view.backgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(TablereLoad)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(TableloadMore)];
    self.tableView.ly_emptyView = [CYEmptyView NullEmptyActionViewWithTarget:self action:@selector(EmptyTablegetData)];
    [self.view addSubview:self.tableView];
    if (self.dataArray.count == 0) {
        self.tableView.mj_footer.hidden = YES;
    }
}
- (void)EmptyTablegetData{
    
}
- (void)TablereLoad{
    
}
- (void)TableloadMore{
    
}
#pragma mark - scrollDeleggate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.bottom -= self.tableView.mj_footer.height;
    self.tableView.scrollIndicatorInsets = contentInset;
    [self.view endEditing:YES];
}


#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}
- (UITableView *)tableView
{
    if(_tableView == nil)
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        _tableView = tableView;
    }
    return _tableView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        _tableViewStyle = style;
    }
    
    return self;
}
- (void)hideRefresh{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
@end
