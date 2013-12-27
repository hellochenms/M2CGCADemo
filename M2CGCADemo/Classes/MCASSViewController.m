//
//  CASSViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCASSViewController.h"

@interface MCASSViewController ()
@property (nonatomic) UIView *rectView;
@property (nonatomic) UITapGestureRecognizer *tap;
@end

@implementation MCASSViewController

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
    
    _rectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _rectView.center = CGPointMake(100, 100);
    _rectView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_rectView];
    
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    [self.view addGestureRecognizer:_tap];
    
}

- (void)onTap{
    __weak MCASSViewController *weakSelf = self;
    
    _tap.enabled = NO;// 亮点 // 防止动画进行中再次触发动画，造成视觉上的不和谐
    //self.view.userInteractionEnabled = NO;// 也可以用这个
    
    [UIView animateWithDuration:1
                     animations:^{
                         weakSelf.rectView.center = CGPointMake(100, 300);
                     } completion:^(BOOL finished) {
                        [UIView animateWithDuration:1
                                         animations:^{
                                             weakSelf.rectView.center = CGPointMake(200, 300);
                                         }
                                         completion:^(BOOL finished) {
                                             weakSelf.tap.enabled = YES;
                                         }];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
