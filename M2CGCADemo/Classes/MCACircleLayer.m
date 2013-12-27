//
//  MCACircleLayer.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCACircleLayer.h"

@implementation MCACircleLayer
@dynamic radius;

- (id)init{
    self = [super init];
    if (self) {
        [self setNeedsDisplay];
    }
    
    return self;
}

- (id)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        self.radius = [layer radius];
    }
    
    return self;
}

- (void)drawInContext:(CGContextRef)ctx{
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGFloat radius = self.radius;
    CGRect rect = CGRectMake((self.bounds.size.width - radius) / 2, (self.bounds.size.height - radius) / 2, radius, radius);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextFillPath(ctx);
}

+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"radius"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)key{
    if ([self presentationLayer] && [key isEqualToString:@"radius"]) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"radius"];
        anim.fromValue = [[self presentationLayer] valueForKey:@"radius"];
        return anim;
    }
    
    return [super actionForKey:key];
}

@end
