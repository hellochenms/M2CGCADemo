//
//  UKDrawViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MUIDrawViewController.h"
#import "MUIDrawView.h"
#import "MUIBezierDrawView.h"
#import "MCGPixelAlignDrawView.h"

@interface MUIDrawViewController ()

@end

@implementation MUIDrawViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    MUIDrawView *drawView = [[MUIDrawView alloc] initWithFrame:CGRectMake(60, 10, 100, 50)];
    [self.view addSubview:drawView];
    
    MUIBezierDrawView *bezierView = [[MUIBezierDrawView alloc] initWithFrame:CGRectMake(0, 70, 320, 100)];
    [self.view addSubview:bezierView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
