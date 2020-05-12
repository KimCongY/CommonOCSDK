//
//  CYDataViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/29.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYDataViewController.h"
#import "CYPeopleModel.h"
#define File_Name @"LZ"
@interface CYDataViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray * dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
@implementation CYDataViewController

- (NSArray *)dataArr{
    if(!_dataArr){
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.dataArr = [CYDataManager Cy_ArrayWithTagname:File_Name];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (IBAction)insertData:(id)sender {
    [CYDataManager Cy_SaveArray:@[@"我是插1",@"我是插2",@"我是插3"] ArrrayWithTagName:File_Name];
//    CYPeopleModel * pe = [CYPeopleModel new];
//    pe.name = @"你好";
//    pe.age = 25;
//    [CYDataManager Cy_SaveArray:@[pe] ArrrayWithTagName:File_Name];
    
    self.dataArr = [CYDataManager Cy_ArrayWithTagname:File_Name];
    [self.tableView reloadData];

}
- (IBAction)deleteData:(id)sender {
    [CYDataManager Cy_ClearArrayWithTagname:File_Name];
    self.dataArr = [CYDataManager Cy_ArrayWithTagname:File_Name];
    [self.tableView reloadData];

}
- (IBAction)upData:(id)sender {
    self.dataArr = [CYDataManager Cy_ArrayWithTagname:File_Name];
    [self.tableView reloadData];
}

@end
