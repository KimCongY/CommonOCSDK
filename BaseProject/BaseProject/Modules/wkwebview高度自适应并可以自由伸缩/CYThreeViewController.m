//
//  CYThreeViewController.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/3/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CYThreeViewController.h"
#import <WebKit/WebKit.h>
#import "CYView.h"
@interface CYThreeViewController ()<WKNavigationDelegate>
{
    UIScrollView * scr;
    UILabel * Titlelab;
    UILabel * Titlelab2;
    MyRelativeLayout * _layout;
    WKWebView * wk;
    CYView * vi;
    NSInteger index;
}
@end

@implementation CYThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    self.navigationItem.leftBarButtonItem = nil;
    
//    CYUserInfomation * user = [[CYUserInfomation alloc]init];
//    user.username = @"刘亦菲";
//    user.phone = @"哟哈";
//    user.tag = @"qyy";
//    [CYUserManager addOrUpdateUserinfomation:user];

//    CYUserInfomation * user = [CYUserManager QueryUserinfomationPrimaryKey:@"qyy"];
//    NSLog(@"用户:username=%@ | phone=%@ ",user.username,user.phone);
//    [CYUserManager DeleteUserinfomationprimaryKey:@"qyy"];
    
    NSLog(@"%@",[RLMRealmConfiguration defaultConfiguration].fileURL);
    [self setFlowayout];
}
- (void)setFlowayout{
    scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49)];
    scr.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scr];
    
    _layout = [MyRelativeLayout new];
    _layout.widthSize.equalTo(scr.widthSize);
    _layout.padding = UIEdgeInsetsMake(0, 0, 10, 0);
    _layout.wrapContentHeight = YES;
    [scr addSubview:_layout];
    
    Titlelab = [[UILabel alloc]init];
    Titlelab.text = @"就噶升级换代个好故事的哈公司的假噶机会大股东就会感动好久啊的环境噶很大的";
    Titlelab.wrapContentHeight = YES;
    Titlelab.leftPos.equalTo(@10);
    Titlelab.rightPos.equalTo(@10);
    Titlelab.topPos.equalTo(@10);
    [_layout addSubview:Titlelab];
    
    vi = [[CYView alloc]init];
    vi.leftPos.equalTo(@0);
    vi.rightPos.equalTo(@0);
    vi.topPos.equalTo(Titlelab.bottomPos).offset(10);
    vi.backgroundColor = [UIColor grayColor];
    vi.heightSize.equalTo(@40);
    [_layout addSubview:vi];
    
    
    
    Titlelab2 = [[UILabel alloc]init];
    Titlelab2.wrapContentHeight = YES;
    Titlelab2.leftPos.equalTo(@10);
    Titlelab2.rightPos.equalTo(@10);
    Titlelab2.topPos.equalTo(vi.bottomPos).offset(10);
    [_layout addSubview:Titlelab2];

    
    UILabel * lab2 = [[UILabel alloc]init];
    lab2.text = @"就噶升级换代个好故事的哈大的";
    lab2.wrapContentHeight = YES;
    lab2.leftPos.equalTo(@10);
    lab2.rightPos.equalTo(@10);
    lab2.backgroundColor = [UIColor whiteColor];
    lab2.topPos.equalTo(Titlelab2.bottomPos).offset(10);
    [_layout addSubview:lab2];
    
    
    wk = [[WKWebView alloc]init];
    wk.navigationDelegate = self;
//    [wk loadHTMLString:[self htmlString] baseURL:nil];
    [wk loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    wk.topPos.equalTo(lab2.bottomPos).offset(10);
    wk.widthSize.equalTo(_layout.widthSize);
    wk.scrollView.scrollEnabled = NO;
    [_layout addSubview:wk];
    [_layout sizeToFit];

    
    


}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    __block CGFloat webViewHeight;
    
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result,NSError * _Nullable error) {
        // 此处js字符串采用scrollHeight而不是offsetHeight是因为后者并获取不到高度，看参考资料说是对于加载html字符串的情况下使用后者可以(@"document.getElementById(\"content\").offsetHeight;")，但如果是和我一样直接加载原站内容使用前者更合适
        //获取页面高度，并重置webview的frame
        webViewHeight = [result doubleValue];
        wk.myHeight = webViewHeight + 70;
        NSLog(@"%f",webViewHeight);
//        [_layout sizeToFit];
        
    }];
    
    NSLog(@"结束加载");
}

-(NSString *)htmlString {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"图文测试" ofType:@"txt"];
    NSString * html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return html;
}
- (void)title_click_event:(UIView *)sender{
    index ++;
    if (index%2==0) {
        Titlelab2.text = nil;
    }else{
        Titlelab2.text = @"艰苦跋涉到家啊家大喊大叫卡活动及哈框架的哈看到；1i 啊好低俗啊的开 u 自己是大坏蛋jhaudygaskdjhaduigasjhdasjdhgasjhdasdhjagdaj";
    }
    [_layout layoutAnimationWithDuration:0.3];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableAttributedString *)setTitle{
    return [self changeTitle:@"点我展开"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
