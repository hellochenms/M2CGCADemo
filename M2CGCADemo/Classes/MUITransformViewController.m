//
//  UKTransformViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MUITransformViewController.h"
#import "MUITransformBezierDrawView.h"

@interface MUITransformViewController ()

@end

@implementation MUITransformViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 0)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.font = [UIFont systemFontOfSize:16];
    textLabel.numberOfLines = 0;
    textLabel.text = @"请对比同一图案的使用变形（transform）的绘制代码（变形-MUITransformBezierDrawView）与未使用变形的绘制代码（UIKit绘图-MUIBezierDrawView），可以发现先不考虑位置甚至缩放专心画图形然后将其缩放并平移到合适位置的代码更好维护一些。\n\n实践中在drawRect中使用transform是常用的，而直接修改view的transform则是有风险的，因为会使view的frame失效（这种情况下要用bounds+center计算）";
    [textLabel sizeToFit];
    [self.view addSubview:textLabel];
    
    MUITransformBezierDrawView *drawView = [[MUITransformBezierDrawView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textLabel.frame) + 10, 320, 100)];
    [self.view addSubview:drawView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
