
//
//  CYChildTwoViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/14.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYChildTwoViewController.h"
#import "CYtabViewController.h"
#import "CYTabview.h"
@interface CYChildTwoViewController ()<UITableViewDelegate, UITableViewDataSource, SGPageTitleViewDelegate, SGPageContentViewDelegate, CYBaseChildVCDelegate>
{
    MyLinearLayout * layout;
    UILabel * lab1;
    NSInteger index;
    UIButton * btn;

}
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@property (nonatomic, strong) CYTabview *tableView;
@property (nonatomic, strong) UIScrollView *childVCScrollView;
@end

@implementation CYChildTwoViewController

static CGFloat const PersonalCenterVCPageTitleViewHeight = 44;
static CGFloat const PersonalCenterVCTopViewHeight = 200;

- (SGPageTitleView *)pageTitleView {
    if (!_pageTitleView) {
        NSArray *titleArr = @[@"主页", @"微博", @"相册",@"主页", @"微博", @"相册",@"主页", @"微博", @"相册"];
        SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
        
        /// pageTitleView
        _pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, PersonalCenterVCPageTitleViewHeight) delegate:self titleNames:titleArr configure:configure];
        _pageTitleView.backgroundColor = [UIColor whiteColor];
    }
    return _pageTitleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}
- (void)setUpView{
    CGFloat tableViewX = 0;
    CGFloat tableViewY = 0;
    CGFloat tableViewW = self.view.frame.size.width;
    CGFloat tableViewH = self.view.frame.size.height;
    self.tableView = [[CYTabview alloc] initWithFrame:CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.sectionHeaderHeight = PersonalCenterVCPageTitleViewHeight;
    _tableView.rowHeight = self.view.frame.size.height - PersonalCenterVCPageTitleViewHeight;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.wrapContentHeight = YES;
    layout.widthSize.equalTo(self.tableView.widthSize);
    layout.padding = UIEdgeInsetsMake(0, 0, 10, 0);
    layout.backgroundColor = [UIColor whiteColor];

    UILabel*title = [[UILabel alloc]init];
    title.text = @"我是标题我是标题我是标题我是标题我是标题";
    title.topPos.equalTo(@10);
    title.leftPos.equalTo(@10);
    title.rightPos.equalTo(@10);
    title.wrapContentHeight = YES;
    [layout addSubview:title];
    
    lab1 = [[UILabel alloc]init];
    lab1.text = @"我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据我是隐藏的数据";
    lab1.topPos.equalTo(title.bottomPos).offset(10);
    lab1.leftPos.equalTo(@10);
    lab1.rightPos.equalTo(@10);
    lab1.wrapContentHeight = YES;
    [layout addSubview:lab1];
    lab1.myVisibility = MyVisibility_Gone;
    
    btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"点击展开" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    btn.topPos.equalTo(lab1.bottomPos).offset(10);
    btn.leftPos.equalTo(@10);
    btn.rightPos.equalTo(@10);
    [btn sizeToFit];//必须加,不然btn点击事件不生效
    [layout addSubview:btn];
    
    //---------------可注释看看效果---------------//
    MyLinearLayout * la = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    la.wrapContentHeight = YES;
    la.widthSize.equalTo(layout.widthSize);
    la.padding = UIEdgeInsetsMake(0, 0, 10, 0);
    la.backgroundColor = [UIColor redColor];
    [layout addSubview:la];
    
    UILabel * ll = [[UILabel alloc]init];
    ll.text = @"我是新来的,请大家多多关照";
    ll.wrapContentHeight = YES;
    ll.leftPos.equalTo(@10);
    ll.rightPos.equalTo(@10);
    ll.topPos.equalTo(@10);
    [la addSubview:ll];
    
    UILabel * ll2 = [[UILabel alloc]init];
    ll2.text = @"我也是是新来的,也请大家多多关照";
    ll2.wrapContentHeight = YES;
    ll2.leftPos.equalTo(@10);
    ll2.rightPos.equalTo(@10);
    ll2.topPos.equalTo(ll.bottomPos).offset(10);
    [la addSubview:ll2];
    //----------------------------------------//

    [layout layoutIfNeeded];
    self.tableView.tableHeaderView = layout;

}
- (void)click{
    index ++;
    if (index%2==0) {
        [btn setTitle:@"点击展开" forState:UIControlStateNormal];
        lab1.myVisibility = MyVisibility_Gone;
    }else{
        [btn setTitle:@"点击收回" forState:UIControlStateNormal];
        lab1.myVisibility = MyVisibility_Visible;
    }

    [UIView animateWithDuration:0.3 animations:^{
        //因为tableHeaderView的特殊情况。如果需要调整tableHeaderView的高度时需要编写如下代码！！！！！
        [self.tableView.tableHeaderView layoutIfNeeded];
        self.tableView.tableHeaderView = self.tableView.tableHeaderView;
        
    }];

}
- (void)title_click_event:(UIView *)sender{
    index ++;
    if (index%2==0) {
        [btn setTitle:@"点击展开" forState:UIControlStateNormal];
        lab1.myVisibility = MyVisibility_Gone;
    }else{
        [btn setTitle:@"点击收回" forState:UIControlStateNormal];
        lab1.myVisibility = MyVisibility_Visible;
    }
    [UIView animateWithDuration:0.3 animations:^{
        //因为tableHeaderView的特殊情况。如果需要调整tableHeaderView的高度时需要编写如下代码！！！！！
        [self.tableView.tableHeaderView layoutIfNeeded];
        self.tableView.tableHeaderView = self.tableView.tableHeaderView;
        
    }];

}
- (SGPageContentView *)pageContentView {
    if (!_pageContentView) {
        CYtabViewController *oneVC = [[CYtabViewController alloc] init];
        oneVC.delegatBaseeChildVC = self;
        CYtabViewController *twoVC = [[CYtabViewController alloc] init];
        twoVC.delegatBaseeChildVC = self;
        CYtabViewController *threeVC = [[CYtabViewController alloc] init];
        threeVC.delegatBaseeChildVC = self;
        
        CYtabViewController *oneVC1 = [[CYtabViewController alloc] init];
        oneVC1.delegatBaseeChildVC = self;
        CYtabViewController *twoVC1 = [[CYtabViewController alloc] init];
        twoVC1.delegatBaseeChildVC = self;
        CYtabViewController *threeVC1 = [[CYtabViewController alloc] init];
        threeVC1.delegatBaseeChildVC = self;
        
        CYtabViewController *oneVC2 = [[CYtabViewController alloc] init];
        oneVC2.delegatBaseeChildVC = self;
        CYtabViewController *twoVC2 = [[CYtabViewController alloc] init];
        twoVC2.delegatBaseeChildVC = self;
        CYtabViewController *threeVC2 = [[CYtabViewController alloc] init];
        threeVC2.delegatBaseeChildVC = self;
        
        
        NSArray *childArr = @[oneVC, twoVC, threeVC,oneVC1, twoVC1, threeVC1,oneVC2, twoVC2, threeVC2];
        /// pageContentView
        CGFloat contentViewHeight = ScreenHeight - CYTopHeight - PersonalCenterVCPageTitleViewHeight;
        _pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:childArr];
        _pageContentView.delegatePageContentView = self;
    }
    return _pageContentView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.childVCScrollView && _childVCScrollView.contentOffset.y > 0) {
        self.tableView.contentOffset = CGPointMake(0, layout.height);
    }
    CGFloat offSetY = scrollView.contentOffset.y;
    if (offSetY < layout.height) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pageTitleViewToTop" object:nil];
    }
}

- (void)CYBaseChildBaseVCScrollViewDidScroll:(UIScrollView *)scrollView {
    self.childVCScrollView = scrollView;
    if (self.tableView.contentOffset.y < layout.height) {
        scrollView.contentOffset = CGPointZero;
        scrollView.showsVerticalScrollIndicator = NO;
    } else {
        self.tableView.contentOffset = CGPointMake(0, layout.height);
        scrollView.showsVerticalScrollIndicator = YES;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.contentView addSubview:self.pageContentView];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.pageTitleView;
}

#pragma mark - - - SGPageTitleViewDelegate - SGPageContentViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageContentViewCurrentIndex:selectedIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    _tableView.scrollEnabled = NO;
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView offsetX:(CGFloat)offsetX {
    _tableView.scrollEnabled = YES;
}

@end
