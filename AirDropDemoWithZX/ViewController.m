//
//  ViewController.m
//  AirDropDemoWithZX
//
//  Created by 张新 on 16/5/8.
//  Copyright © 2016年 zhangxin. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"
@interface ViewController ()
@property(nonatomic,strong)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    [self addUI];
}
-(void)addUI{
    [self.view addSubview:self.btn];
    
}
- (UIButton *)btn{
    if (!_btn) {
        _btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [_btn setTitle:@"发送文件" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        _btn.frame=CGRectMake(0, 0, 100, 50);
        _btn.center=CGPointMake([UIScreen mainScreen].bounds.size.width*0.5, [UIScreen mainScreen].bounds.size.height*0.5);
    }
    return _btn;
}
#pragma mark - btnAction
-(void)btnAction{
    DemoViewController *demoVC=[[DemoViewController alloc]init];
    [self.navigationController pushViewController:demoVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
