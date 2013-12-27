//
//  MCACustomPropertyViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCACustomPropertyViewController.h"
#import "MCACircleLayer.h"

@interface MCACustomPropertyViewController ()
@property (nonatomic) MCACircleLayer *circleLayer;
@end

@implementation MCACustomPropertyViewController

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
    
    self.circleLayer = [MCACircleLayer layer];
    self.circleLayer.frame = CGRectMake(100, CGRectGetMaxY(startAnimaButton.frame) + 10, 120, 120);
    [self.view.layer addSublayer:self.circleLayer];
    
}

- (void)onTapStartAnima{
    [CATransaction begin];
    [CATransaction setAnimationDuration:1];
    self.circleLayer.radius = arc4random() % 150;
    [CATransaction commit];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
