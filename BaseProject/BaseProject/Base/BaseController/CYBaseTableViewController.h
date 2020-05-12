//
//  CYBaseTableViewController.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYBaseViewController.h"

@interface CYBaseTableViewController : CYBaseViewController<UITableViewDelegate, UITableViewDataSource>
// 这个代理方法如果子类实现了, 必须调用super
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

@property (weak, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * dataArray;

// tableview的样式, 默认plain
- (instancetype)initWithStyle:(UITableViewStyle)style;

//请求失败重新请求数据
- (void)EmptyTablegetData;
//table刷新数据
- (void)TablereLoad;
//加载更多数据
- (void)TableloadMore;

- (void)hideRefresh;

@end
