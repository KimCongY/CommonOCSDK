
//
//  CYImgBrowser.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYImgBrowser.h"
#import "KSPhotoBrowser.h"

@interface CYImgBrowser()
{
    KSPhotoBrowser * browser;
}
@property (nonatomic,strong) NSArray * urls;
@property (nonatomic,strong) UIViewController * controller;
@property (nonatomic,strong) NSArray * imgs;
@end
@implementation CYImgBrowser
- (instancetype)initWithimgUrls:(NSArray *)urls placeholderImgs:(NSArray<UIImageView *> *)imgs Controller:(UIViewController *)controller{
    self = [super init];
    if (self) {
        self.urls = urls;
        self.imgs = imgs;
        self.controller = controller;
    }
    return self;
}
- (void)showImg{
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < self.urls.count; i++) {
        NSString *url = [self.urls[i] stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:self.imgs[i] imageUrl:[NSURL URLWithString:url]];
        [items addObject:item];
    }
    browser= [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:0];
    [self setBrowserConfig];
    [browser showFromViewController:self.controller];
}
- (void)setBrowserConfig{
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleNone;
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlack;
    browser.loadingStyle = KSPhotoBrowserImageLoadingStyleDeterminate;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleText;
    browser.bounces = 0;
}

@end
