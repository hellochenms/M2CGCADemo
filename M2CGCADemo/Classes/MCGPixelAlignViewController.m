//
//  UKPixelAlignViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCGPixelAlignViewController.h"
#import "MCGPixelAlignDrawView.h"

@interface MCGPixelAlignViewController (){
    UIScrollView *_mainScrollContainer;
    UILabel *_textLabel;
    MCGPixelAlignDrawView *_pixelView;
}
@end

@implementation MCGPixelAlignViewController

- (void)loadView{
    self.view = [UIView new];
    CGRect frame = [UIScreen mainScreen].bounds;
    frame.size.height = frame.size.height - 20 - 44;
    _mainScrollContainer = [[UIScrollView alloc] initWithFrame: frame];
    [self.view addSubview:_mainScrollContainer];
    
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(frame) - 20, 0)];
    _textLabel.backgroundColor = [UIColor clearColor];
    _textLabel.font = [UIFont systemFontOfSize:16];
     _textLabel.numberOfLines = 0;
    _textLabel.text = @"下面图中的两条线，在低清屏幕上看的话，会发现第一条线模糊了。\n线宽度是3单位，在低清屏上是3像素，使用CGContextStrokePath画图时，画从(10, 10)到(200, 10)的线时，系统会将线的宽度中央对齐到给的直线，即线实际填充了y方向上8.5到11.5的区域。\n由于最小填充单位是1像素，所以系统会取y方向上8到8.5的颜色和8.5到9颜色的平均值，填充8到9这个像素（填充11到12也类似），结果就是中间深两边浅看上去模糊了。\n第2条线是从(10, 20.5)到(200, 20.5)，同理分析后可知其是像素对齐的，不会模糊。\n系统的这个调整也会用于抗锯齿。\n填充因为没有path宽度的概念，不会有这个问题";
    [_textLabel sizeToFit];
    [_mainScrollContainer addSubview:_textLabel];
    
    _pixelView = [[MCGPixelAlignDrawView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_textLabel.frame) + 10, CGRectGetWidth(frame) - 20, 160)];
    [_mainScrollContainer addSubview:_pixelView];
    
    _mainScrollContainer.contentSize = CGSizeMake(CGRectGetWidth(_mainScrollContainer.frame), CGRectGetMaxY(_pixelView.frame) + 10);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
