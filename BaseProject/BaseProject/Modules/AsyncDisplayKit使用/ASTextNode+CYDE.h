//
//  ASTextNode+CYDE.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <AsyncDisplayKit/ASTextNode.h>

@interface ASTextNode (CYDE)
+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr;
+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr LineCount:(NSInteger)lineCount;
@end
