//
//  DemoViewController.m
//  AirDropDemoWithZX
//
//  Created by 张新 on 16/5/8.
//  Copyright © 2016年 zhangxin. All rights reserved.
//

#import "DemoViewController.h"
@interface DemoViewController ()
@property(nonatomic,strong)UIWebView *webView;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self addUI];
    [self loadDataFile];
   
}
-(void)loadDataFile{
    NSURL *fileURL=[self returnURLWithFileName:@"demo.png"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:fileURL]];
}
-(void)addUI{
    //add webView
    [self.view addSubview:self.webView];
    //add rightBarItem
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStyleDone target:self action:@selector(sharedAction)];
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView=[[UIWebView alloc]init];
        _webView.frame=self.view.bounds;
    }
    return _webView;
}
#pragma mark -return URL for fileName
-(NSURL *)returnURLWithFileName:(NSString *)fileName{
    NSArray *arrs=[fileName componentsSeparatedByString:@"."];
    NSString *pathStr=[[NSBundle mainBundle] pathForResource:arrs.firstObject ofType:arrs[1]];
    NSURL *fileURL=[NSURL fileURLWithPath:pathStr];
    return fileURL;
    
    
}

#pragma mark rightBarItem Action
-(void)sharedAction{
    NSLog(@"rightBarItem is clicked");
    NSURL *fileURL=[self returnURLWithFileName:@"demo.png"];
    NSArray *urls=@[fileURL];
    UIActivityViewController *activituVC=[[UIActivityViewController alloc]initWithActivityItems:urls applicationActivities:nil];
    NSArray *cludeActivitys=@[UIActivityTypePostToFacebook,
                               UIActivityTypePostToTwitter,
                               UIActivityTypePostToWeibo,
                               UIActivityTypePostToVimeo,
                               UIActivityTypeMessage,
                               UIActivityTypeMail,
                               UIActivityTypeCopyToPasteboard,
                               UIActivityTypePrint,
                               UIActivityTypeAssignToContact,
                               UIActivityTypeSaveToCameraRoll,
                               UIActivityTypeAddToReadingList,
                               UIActivityTypePostToFlickr,
                               UIActivityTypePostToTencentWeibo];
    activituVC.excludedActivityTypes=cludeActivitys;

    [self presentViewController:activituVC animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
