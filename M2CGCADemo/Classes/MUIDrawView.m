//
//  UKDrawView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MUIDrawView.h"

@implementation MUIDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
    [[UIColor redColor] setFill];
    UIRectFill(rect);
    [[UIColor blueColor] setStroke];
    UIRectFrame(rect);
}

@end
