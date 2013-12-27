//
//  UIDrawBezierView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MUIBezierDrawView.h"

@implementation MUIBezierDrawView

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
    // Drawing code
    CGSize size = rect.size;
    CGFloat margin = 10;
    CGFloat radius = rint((MIN(size.width, size.height) - margin) / 4.0);;
    
    CGFloat xOffset = 0;
    CGFloat yOffset = 0;
    
    CGFloat offset = rint(size.width - size.height) / 2;
    if (offset >= 0) {
        xOffset = offset + margin / 2;
        yOffset = margin / 2;
    }else{
        xOffset = margin / 2;
        yOffset = offset + margin / 2;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(xOffset + radius, yOffset + radius * 2)
                    radius:radius
                startAngle:M_PI_2
                  endAngle:-M_PI_2
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(xOffset + radius * 2, yOffset + radius)
                    radius:radius
                startAngle:M_PI
                  endAngle:0
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(xOffset + radius * 3, yOffset + radius * 2)
                    radius:radius
                startAngle:-M_PI_2
                  endAngle:M_PI_2
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(xOffset + radius * 2, yOffset + radius * 3)
                    radius:radius
                startAngle:0
                  endAngle:M_PI
                 clockwise:YES];
    [path closePath];
    
    [[UIColor blueColor] setFill];
    [path fill];
    [[UIColor redColor] setStroke];
    [path stroke];
}

@end
