//
//  MCGImageViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCGImageViewController.h"
#import "MCGTextImageView.h"
#import "MCGTextRotateView.h"

@interface MCGImageViewController (){
    MCGTextRotateView *_textRotateView;
    NSArray *_texts;
}
@end

@implementation MCGImageViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        _texts = @[@"春眠不觉晓，夏眠秋眠冬眠也一样",
                  @"生如夏花之绚烂，死如秋叶之静美",
                  @"安得广厦千万间，大庇天下寒士俱欢颜",
                  @"生于忧患，死于安乐",
                  @"业精于勤而荒于嬉，行成于思而毁于随",
                  @"熊的力量豹的速度鹰的眼睛狼的耳朵"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    MCGTextImageView *textImageView = [[MCGTextImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 100)];
    textImageView.imageText = @"据说\n打几个字\n就点个回车\n就叫诗";
    [self.view addSubview:textImageView];
    
    _textRotateView = [[MCGTextRotateView alloc] initWithFrame:CGRectMake(20, 120, 280, 280)];
    _textRotateView.userInteractionEnabled = YES;
    [self.view addSubview:_textRotateView];
    
    UIButton *changeTextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeTextButton.frame = CGRectMake(CGRectGetWidth(_textRotateView.bounds) - 10 - 60, 10, 60, 30);
    changeTextButton.backgroundColor = [UIColor blueColor];
    changeTextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [changeTextButton setTitle:@"改变文字" forState:UIControlStateNormal];
    [changeTextButton addTarget:self action:@selector(onTapChangeTextButton) forControlEvents:UIControlEventTouchUpInside];
    [_textRotateView addSubview:changeTextButton];
    
    [changeTextButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTapChangeTextButton{
    _textRotateView.text = [_texts objectAtIndex:arc4random() % _texts.count];
}

@end
