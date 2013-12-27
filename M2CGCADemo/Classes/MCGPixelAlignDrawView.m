//
//  PixelAlignDrawView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCGPixelAlignDrawView.h"

@implementation MCGPixelAlignDrawView

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
- (void)drawRect:(CGRect)rect
{
    NSLog(@"  @@%s", __func__);
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetLineWidth(context, 3);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 200, 10);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 10, 20.5);
    CGContextAddLineToPoint(context, 200, 20.5);
    CGContextStrokePath(context);
}

@end
