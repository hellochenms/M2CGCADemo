//
//  MCADrawLayerView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCADrawLayerView.h"
@interface MCADrawLayerView()
@property (nonatomic) CALayer *bgLayer;
@property (nonatomic) CALayer *contentLayer;
@end

@implementation MCADrawLayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bgLayer = [CALayer layer];
        [self.layer addSublayer:self.bgLayer];
        self.contentLayer = [CALayer layer];
        [self.layer addSublayer:self.contentLayer];
        
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 6;//
        
        [self.layer setNeedsDisplay];
    }
    return self;
}

- (void)setText:(NSString *)text{
    if ([text isEqualToString:_text]
        || (!_text && !text) ) {
        return;
    }
    _text = [text copy];
    [self.layer setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    UIGraphicsPushContext(ctx);
    [self drawBgLayer:self.bgLayer inContext:ctx];
    [self drawContentLayer:self.contentLayer inContext:ctx];
    UIGraphicsPopContext();
}

- (void)drawBgLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    [[UIColor lightGrayColor] set];
    UIRectFill(self.bounds);
}

- (void)drawContentLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    [[UIColor blueColor] set];
    UIFont *font = [UIFont systemFontOfSize:12];
    [(self.text ? self.text : @"") drawInRect:CGRectMake(20, 10, CGRectGetWidth(self.bounds) - 40, CGRectGetHeight(self.bounds) - 20)
                                     withFont:font
                                lineBreakMode:NSLineBreakByWordWrapping];
}




@end
