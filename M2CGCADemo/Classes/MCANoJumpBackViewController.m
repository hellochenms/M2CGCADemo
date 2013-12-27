//
//  MCANoJumpBackViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCANoJumpBackViewController.h"

@interface MCANoJumpBackViewController (){
    BOOL _isOpacity0;
    BOOL _isMiddleLayerOpacity0;
}
@property (nonatomic) CALayer *leftLayer;
@property (nonatomic) CALayer *middlelayer;
@end

@implementation MCANoJumpBackViewController

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
    self.leftLayer.frame = CGRectMake(10, CGRectGetMaxY(startAnimaButton.frame) + 10, 30, 30);
    self.leftLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.leftLayer];
    
    UIButton *startTimeAnimaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startTimeAnimaButton.frame = CGRectMake(10, CGRectGetMaxY(self.leftLayer.frame) + 20, 300, 50);
    startTimeAnimaButton.backgroundColor = [UIColor blueColor];
    startTimeAnimaButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [startTimeAnimaButton setTitle:@"开始延时动画" forState:UIControlStateNormal];
    [startTimeAnimaButton addTarget:self action:@selector(onTapStartTimeAnima) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startTimeAnimaButton];
    
    self.middlelayer = [CALayer layer];
    self.middlelayer.frame = CGRectMake(10, CGRectGetMaxY(startTimeAnimaButton.frame) + 10, 30, 30);
    self.middlelayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.middlelayer];
}

- (void)onTapStartAnima{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];// 屏蔽默认动画
    self.leftLayer.opacity = (_isOpacity0 ? 1 : 0);
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = (_isOpacity0 ? @0 : @1);
    anima.toValue = (_isOpacity0 ? @1 : @0);
    _isOpacity0 = !_isOpacity0;
    anima.duration = 1;
    [self.leftLayer addAnimation:anima forKey:@"anima"];
    NSLog(@"self.leftLayer.opacity(%f)  @@%s", self.leftLayer.opacity, __func__);
    [CATransaction commit];
}

- (void)onTapStartTimeAnima{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];// 屏蔽默认动画
    self.middlelayer.opacity = (_isMiddleLayerOpacity0 ? 1 : 0);
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.beginTime = CACurrentMediaTime() + 1;
    anima.fillMode = kCAFillModeBackwards;// 防止延时跳变，可以注释掉看看效果
    anima.duration = 2;
    anima.fromValue = _isMiddleLayerOpacity0 ? @0 : @1;
    anima.toValue = _isMiddleLayerOpacity0 ? @1 : @0;
    _isMiddleLayerOpacity0 = !_isMiddleLayerOpacity0;
    [self.middlelayer addAnimation:anima forKey:@"anima"];
    [CATransaction commit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
