//
//  CYTestViewModel.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/6/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYTestViewModel.h"
@interface CYTestViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * table;
@end

@implementation CYTestViewModel
- (void)bindView:(UIView * )view;
{
    self.table = (UITableView *)view;
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}
- (RACCommand *)testCommand{
    if (! _testCommand){
        _testCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:input];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _testCommand;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.testCommand execute:indexPath];
}
@end
