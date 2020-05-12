//
//  CYAsyncKitControllerViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/12.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYAsyncKitControllerViewController.h"
#import "ASTableNode+DE.h"
#import "CYAsyncModel.h"
#import "CYAsyncCellNode.h"
@interface CYAsyncKitControllerViewController ()<ASTableDelegate,ASTableDataSource>
{
    NSInteger page;
}
@property (nonatomic,strong) ASTableNode * tableNode;
@property (nonatomic, strong) NSMutableArray<CYAsyncModel *> *modelArray;
@end

@implementation CYAsyncKitControllerViewController

- (NSMutableArray<CYAsyncModel *> *)modelArray{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    page = 0;
    [self setupTableNode];
}
- (void)setupTableNode{
    _tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    _tableNode.backgroundColor = [UIColor grayColor];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableNode.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-CYTopHeight);
    [self.view addSubnode:_tableNode];
    _tableNode.view.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        page = 0;
        [self.modelArray removeAllObjects];
        [_tableNode.view.mj_header endRefreshing];
        [_tableNode reloadData];
    }];
    _tableNode.view.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
    }];
}
//是否还有更多
- (BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    if (self.modelArray.count > 200) {
        [_tableNode.view.mj_footer endRefreshingWithNoMoreData];
        return NO;
    }
    return YES;
}
- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode;
{
    return 1;
}
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}
//- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}
-(ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    CYAsyncModel * model = self.modelArray[indexPath.row];
    return ^{
        CYAsyncCellNode * cellNode = [[CYAsyncCellNode alloc]initWithModel:model withVC:self];
        CYWeakSelf(weakSelf)
        if (!cellNode.moreButtonClickedBlock) {
            [cellNode setMoreButtonClickedBlock:^(NSIndexPath *indexPath) {
                CYAsyncModel * model = weakSelf.modelArray[indexPath.row];
                model.isOpen = !model.isOpen;
                [weakSelf.tableNode reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }];
        }
        return cellNode;
    };
}
- (void)tableView:(ASTableView *)tableView willBeginBatchFetchWithContext:(ASBatchContext *)context {
    CYWeakSelf(weakSelf)
    [self getData:^(NSArray * array) {
        [weakSelf insertNewRowsInTableView:array];
        [context completeBatchFetching:YES];
    }];
}
- (void)insertNewRowsInTableView:(NSArray *)newAnimals {
    NSInteger oldCount = self.modelArray.count;
    [self.modelArray addObjectsFromArray:newAnimals];
    [_tableNode insertRowWithStart:oldCount NewCount:self.modelArray.count];
}
- (void)getData:(void(^)(NSArray *))Lastbolck{
    page ++;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [CYNetworkRequest GetUrl:nil parameters:@{@"rn":@"20",@"pn":[NSString stringWithFormat:@"%ld",(long)page],@"tag1":@"明星",@"tag2":@"全部",@"ftags":@"小清新"} Success:^(id response, NSString *resultState, NSString *msg) {
            NSArray<CYAsyncModel *> * dataArr = [CYAsyncModel mj_objectArrayWithKeyValuesArray:response];

            dispatch_async(dispatch_get_main_queue(), ^{
                Lastbolck(dataArr);
            });
        } Failure:^(NSError *error) {
            
        }];
    });

}
- (void)dealloc{
    NSLog(@"销毁---");
}
@end
