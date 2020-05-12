//
//  CYAsyncCellNode.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/12.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYAsyncModel.h"
@interface CYAsyncCellNode : ASCellNode
- (instancetype)initWithModel:(CYAsyncModel *)model withVC:(UIViewController *)vc;
@property (nonatomic, copy) void (^moreButtonClickedBlock)(NSIndexPath *indexPath);

@end
