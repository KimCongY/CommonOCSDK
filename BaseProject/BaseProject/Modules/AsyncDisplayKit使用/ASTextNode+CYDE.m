//
//  ASTextNode+CYDE.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ASTextNode+CYDE.h"

@implementation ASTextNode (CYDE)
+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr{
    return [self createWithAttr:attr LineCount:0];
    
}

+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr LineCount:(NSInteger)lineCount{
    ASTextNode *textNode = [ASTextNode new];
    textNode.attributedText = attr;
    textNode.placeholderEnabled = YES;
    textNode.placeholderFadeDuration = 0.2;
    textNode.placeholderColor = [UIColor colorWithWhite:0.777 alpha:1.0];
    textNode.maximumNumberOfLines = lineCount;
    textNode.truncationMode = NSLineBreakByTruncatingTail;
    return textNode;
    
}
@end
