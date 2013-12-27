//
//  MCGSampleView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCGSampleView.h"

const CGFloat kXScale = 5.0;
const CGFloat kYScale = 100.0;

@implementation MCGSampleView{
    NSMutableArray *_values;
    dispatch_source_t _timer;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setContentMode:UIViewContentModeRight];
        
        _values = [NSMutableArray array];
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        CGFloat timeInterval = 0.25;
        dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), timeInterval * NSEC_PER_SEC, 0);
        __weak MCGSampleView *weakSelf = self;
        dispatch_source_set_event_handler(_timer, ^{
            [weakSelf updateValues];
        });
        dispatch_resume(_timer);
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
    // Drawing code
    if (_values.count <= 0) {
        return;
    }
    NSLog(@"_values.count(%d)  @@%s", _values.count, __func__);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 5);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGAffineTransform transform = CGAffineTransformMake(kXScale, 0, 0, kYScale, 0, self.bounds.size.height / 2);
    CGFloat y = [[_values objectAtIndex:0] floatValue];
    CGPathMoveToPoint(path, &transform, 0, y);
    for (int i = 1; i < [_values count]; i++) {
        y = [[_values objectAtIndex:i] floatValue];
        CGPathAddLineToPoint(path, &transform, i, y);
    }
    CGContextAddPath(context, path);
    CGPathRelease(path);
    CGContextStrokePath(context);
}

#pragma mark - timer event
- (void)updateValues{
    CGFloat nextValue = sin(CFAbsoluteTimeGetCurrent()) + rand() / (float)RAND_MAX;
    NSLog(@"nextValue(%f)  @@%s", nextValue, __func__);
    [_values addObject:@(nextValue)];
    CGSize size = self.bounds.size;
    CGFloat maxDimension = size.width;
    CGFloat maxValueCount = floorl(maxDimension / kXScale);
    if ([_values count] > maxValueCount){
        [_values removeObjectsInRange:NSMakeRange(0, [_values count] - maxValueCount)];
    }
    
    [self setNeedsDisplay];
}

#pragma mark -
- (void)dealloc{
    dispatch_source_cancel(_timer);
}

@end
