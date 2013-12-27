//
//  ImplicitViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "ImplicitViewController.h"

@interface ImplicitViewController ()
@property (nonatomic) CALayer *leftLayer;
@property (nonatomic) CALayer *middleLayer1;
@property (nonatomic) UIView *rightView;
@end

@implementation ImplicitViewController

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
    UIButton *startAnimaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startAnimaButton.frame = CGRectMake(10, 10, 300, 50);
    startAnimaButton.backgroundColor = [UIColor blueColor];
    startAnimaButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [startAnimaButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [startAnimaButton addTarget:self action:@selector(onTapStartAnima) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startAnimaButton];
    
    self.leftLayer = [CALayer layer];
    self.leftLayer.frame = CGRectMake(10, 70, 20, 20);
    self.leftLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.leftLayer];
    
    self.middleLayer1 = [CALayer layer];
    self.middleLayer1.frame = CGRectMake(70, 70, 20, 20);
    self.middleLayer1.backgroundColor = randomColor.CGColor;
    [self.view.layer addSublayer:self.middleLayer1];
    
    self.rightView = [[UIView alloc] initWithFrame:CGRectMake(290, 70, 20, 20)];
    self.rightView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.rightView];
}

- (void)onTapStartAnima{
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:1];
    self.leftLayer.position = CGPointMake(self.leftLayer.position.x, 150);
    [CATransaction commit];
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2];
    self.middleLayer1.position = CGPointMake(self.middleLayer1.position.x, 150);
    // TODO:这么连接动画不行，暂不清除如何实现
//    __weak ImplicitViewController *weakSelf = self;
//    [CATransaction setCompletionBlock:^{
//        [CATransaction begin];
//        [CATransaction setAnimationDuration:2];
//        weakSelf.middleLayer1.position = CGPointMake(self.middleLayer1.position.x, 80);
//        [CATransaction commit];
//    }];
    [CATransaction commit];
    
    self.rightView.center = CGPointMake(self.rightView.center.x, 150);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
