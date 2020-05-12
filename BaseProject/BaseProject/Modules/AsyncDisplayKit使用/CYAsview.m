//
//  CYAsview.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYAsview.h"
#import "NSAttributedString+CYDE.h"
@implementation CYAsview
{
    ASTextNode * nameText;
    ASImageNode * starImg;
    NSString * titlename;
}
- (instancetype)initWithstring:(NSString *)title{
    if (self = [super init]) {
        titlename = title;
        [self setupView];
    }
    return self;
}
- (void)setupView{
    nameText = [[ASTextNode alloc]init];
    
    if (titlename != nil) {
         nameText.attributedText = [NSAttributedString attributedStringWithString:titlename fontSize:14 color:[UIColor yellowColor] firstWordColor:nil];
    }
   
    [self addSubnode:nameText];
    
    starImg = [[ASImageNode alloc]init];
    starImg.image = [UIImage imageNamed:@"帽子"];
    [self addSubnode:starImg];
    
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    nameText.style.flexGrow = 1.0;
    nameText.style.flexShrink = 1.0;
//    nameText.maximumNumberOfLines = 3;
    starImg.style.preferredSize = CGSizeMake(15, 15);

//    ASInsetLayoutSpec *  rightstac = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero child:starImg];
    
    ASStackLayoutSpec *  stac = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                             spacing:0
                                                                      justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter
                                                                            children:@[nameText,starImg]];
    
    ASInsetLayoutSpec * insert = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 5, 10) child:stac];
    return insert;
    
    
}
@end
