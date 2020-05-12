//
//  CYAsyncCellNode.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/12.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYAsyncCellNode.h"
#import "Factories.h"
#import "ASNetworkImageNode+DE.h"
#import "ASTextNode+CYDE.h"
#import "CYAsview.h"
#import "NSAttributedString+CYDE.h"
@interface CYAsyncCellNode()
{
    //底部
    ASTextNode * nameText;
    ASImageNode * starImg;
}
@property(nonatomic, strong) CYAsyncModel *model;
@property (strong, nonatomic) ASNetworkImageNode *postImageNode;
@property (strong, nonatomic) ASTextNode * titleNode;
//@property (strong, nonatomic) CYAsview * botview;
@property (strong, nonatomic) UIViewController * vc;
@end

@implementation CYAsyncCellNode


- (instancetype)initWithModel:(CYAsyncModel *)model withVC:(UIViewController *)vc{
    if (self = [super init]) {
        self.model = model;
        self.vc = vc;
        [self setupCellView];
    }
    return self;
}
- (void)click{
    if (self.model.image_url != nil) {
        CYImgBrowser * brow = [[CYImgBrowser alloc]initWithimgUrls:@[self.model.image_url] placeholderImgs:@[_postImageNode.view] Controller:self.vc];
        [brow showImg];
    }
}
- (void)setupCellView{
    _postImageNode = [ASNetworkImageNode createWithURLStr:self.model.image_url];
    _postImageNode.userInteractionEnabled = YES;
    [_postImageNode addTarget:self action:@selector(click) forControlEvents:ASControlNodeEventTouchUpInside];
    [self addSubnode:_postImageNode];


    _titleNode = [[ASTextNode alloc]init];
    if (self.model.abs != nil) {
        NSDictionary *attrs = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName: [UIColor redColor], };
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:self.model.abs attributes:attrs];
        _titleNode.attributedText = string;
    }
    [self addSubnode:_titleNode];
    
    
    //底部
    nameText = [[ASTextNode alloc]init];
    
    if (self.model.abs != nil) {
        nameText.attributedText = [NSAttributedString attributedStringWithString:self.model.abs fontSize:14 color:[UIColor yellowColor] firstWordColor:nil];
    }
    [nameText addTarget:self action:@selector(moreButtonClicked) forControlEvents:ASControlNodeEventTouchUpInside];
    [self addSubnode:nameText];
    
    starImg = [[ASImageNode alloc]init];
    starImg.image = [UIImage imageNamed:@"帽子"];
    [self addSubnode:starImg];

}
- (void)moreButtonClicked
{
    if (self.moreButtonClickedBlock) {
        self.moreButtonClickedBlock(self.indexPath);
    }
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    ASRatioLayoutSpec *postImageRatioSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:9.0/16.0 child:_postImageNode];
    ASInsetLayoutSpec * titleinsert = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(INFINITY, 20, 20, 10) child:_titleNode];
    ASRelativeLayoutSpec *titleRelativeSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionEnd sizingOption:ASRelativeLayoutSpecSizingOptionMinimumWidth child:titleinsert];
    ASInsetLayoutSpec * insert = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:postImageRatioSpec];
    ASOverlayLayoutSpec * overPlay = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:insert overlay:titleRelativeSpec];
    
    //底部
    nameText.style.flexShrink = 1.0;
    if (!self.model.isOpen) {
        nameText.maximumNumberOfLines = 1;
    }else{
        nameText.style.flexGrow = 1.0;
    }
    //    nameText.maximumNumberOfLines = 3;
    starImg.style.preferredSize = CGSizeMake(15, 15);
    
    //    ASInsetLayoutSpec *  rightstac = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero child:starImg];
    
    ASStackLayoutSpec *  bottomstac = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                        spacing:0
                                                                 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter
                                                                       children:@[nameText,starImg]];
    
    ASInsetLayoutSpec * bottominsert = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 5, 10) child:bottomstac];

    ASStackLayoutSpec * stac = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                       spacing:0
                                                                justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStretch
                                                                      children:@[overPlay,bottominsert]];
    
    return stac;
}
@end
