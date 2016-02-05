//
//  ViewController.m
//  demo1
//
//  Created by huangjin on 16/1/20.
//  Copyright © 2016年 huangjin. All rights reserved.
//

#import "ViewController.h"
#import "PhotoLabstream.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [button setTitle:@"确定" forState:0];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)click:(id)sender
{
    NSArray*array=@[[UIImage imageNamed:@"list_icon_legend@3x"],[UIImage imageNamed:@"btn_start_1@3x"],[UIImage imageNamed:@"00_Start"],[UIImage imageNamed:@"01_Title"],[UIImage imageNamed:@"02_Menu"],[UIImage imageNamed:@"111.jpg"]];
    PhotoLabstream*s=[[PhotoLabstream alloc]initWithFrame:[UIScreen mainScreen].bounds Images:array isShowPage:NO];
    s.pageIndicatorColor=[UIColor whiteColor];
    s.currentPageIndicatorColor=[UIColor orangeColor];
    
    [self.view addSubview:s];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
