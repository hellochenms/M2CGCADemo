//
//  MCA3DViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-24.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCA3DViewController.h"
#import "MCABoxView.h"

const CGFloat kPanScale = 1.0 / 100;

@interface MCA3DViewController (){
    MCABoxView *_boxView;
    CGPoint _lastTranslation;
    CGPoint _curTranslation;
}
@end

@implementation MCA3DViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        _lastTranslation = CGPointZero;
        _curTranslation = CGPointZero;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _boxView = [[MCABoxView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    [self.view addSubview:_boxView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [self.view addGestureRecognizer:pan];
}

- (void)onPan:(UIPanGestureRecognizer*)pan{
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [pan translationInView:pan.view];
//        NSLog(@"%f, %f  @@%s", kPanScale * translation.x, -kPanScale * translation.y, __func__);
        _curTranslation.x = _lastTranslation.x + translation.x;
        _curTranslation.y = _lastTranslation.y + translation.y;
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.0 / 2000;
        transform = CATransform3DRotate(transform, kPanScale * _curTranslation.x, 0, 1, 0);
        transform = CATransform3DRotate(transform, -kPanScale * _curTranslation.y, 1, 0, 0);
        _boxView.layer.sublayerTransform = transform;
    }else if(pan.state == UIGestureRecognizerStateEnded){
        _lastTranslation = _curTranslation;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
