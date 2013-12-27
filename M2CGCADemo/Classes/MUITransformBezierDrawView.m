//
//  UKTransformDrawView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MUITransformBezierDrawView.h"

@implementation MUITransformBezierDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    // Drawing code
    CGSize size = rect.size;
    CGFloat margin = 10;
    
    CGFloat radius = 1;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(-radius, 0)
                    radius:radius
                startAngle:M_PI_2
                  endAngle:-M_PI_2
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(0, -radius)
                    radius:radius
                startAngle:M_PI
                  endAngle:0
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius, 0)
                    radius:radius
                startAngle:-M_PI_2
                  endAngle:M_PI_2
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(0, radius)
                    radius:radius
                startAngle:0
                  endAngle:M_PI
                 clockwise:YES];
    [path closePath];
    
    CGFloat actualRadius = rint((MIN(size.width, size.height) - margin) / 4.0);
    CGFloat scale = actualRadius / radius;
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    [path applyTransform:transform];
    transform = CGAffineTransformMakeTranslation(size.width / 2, size.height / 2);
    [path applyTransform:transform];
    
    [[UIColor blueColor] setFill];
    [path fill];
    [[UIColor redColor] setStroke];
    [path stroke];
}

@end
