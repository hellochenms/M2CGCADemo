//
//  MCGTextRotateView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCGTextRotateView.h"

@implementation MCGTextRotateView{
    BOOL _isTextChanged;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setText:(NSString *)text{
    if ([text isEqualToString:_text]) {
        return;
    }
    _text = [text copy];
    _isTextChanged = YES;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor lightGrayColor] set];
    UIRectFill(rect);
    
    static CGLayerRef layer = nil;
    if (!layer || _isTextChanged) {
        CGRect textBounds = CGRectMake(0, 0, 180, 20);
        layer = CGLayerCreateWithContext(context, textBounds.size, NULL);
        CGContextRef textContext = CGLayerGetContext(layer);
        UIGraphicsPushContext(textContext);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        UIFont *font = [UIFont systemFontOfSize:11];
        [(_text ? _text : @"") drawInRect:textBounds
                 withFont:font
            lineBreakMode:NSLineBreakByWordWrapping];
        UIGraphicsPopContext();
        _isTextChanged = NO;
    }
    
    CGContextTranslateCTM(context, self.bounds.size.width / 2, self.bounds.size.height / 2);
    for (int i = 0; i < 10; i++) {
        CGContextRotateCTM(context, M_PI * 2 / 10);
        CGContextDrawLayerAtPoint(context, CGPointZero, layer);
    }
}


@end
