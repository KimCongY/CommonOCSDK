//
//  CYTwoViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYTwoViewController.h"
#import "CYChildViewController.h"
@interface CYTwoViewController ()
@end

@implementation CYTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"朋友圈";
    self.navigationItem.leftBarButtonItem = nil;
    self.tableView.height = ScreenWidth-49;
}
- (void)title_click_event:(UIView *)sender{
    [CYAlert  alerWithController:self.navigationController alertWithTitle:@"我是标题" WithMessage:@"是否退出" Sure:^{
        NSLog(@"1");
    } Cancel:^{
        NSLog(@"2");

    }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"cell"];
    cell.textLabel.text = @"你好";
    return cell;
}
- (void)EmptyTablegetData{
    [super EmptyTablegetData];
    self.dataArray = [NSMutableArray arrayWithArray:@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""]];
    [self.tableView reloadData];
    [self hideRefresh];
}
- (void)TablereLoad{
    [super TablereLoad];
    [self hideRefresh];
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
}
- (void)TableloadMore{
    [super TableloadMore];
    [self hideRefresh];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CYChildViewController * child = [[CYChildViewController alloc]init];
    child.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:child animated:YES];
}
@end
