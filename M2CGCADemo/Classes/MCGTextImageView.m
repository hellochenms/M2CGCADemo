//
//  MCGImageView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCGTextImageView.h"

@implementation MCGTextImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setImageText:(NSString *)imageText{
    _imageText = [imageText copy];
    self.image = [self reversedImageForText:imageText];
}

- (UIImage*)reversedImageForText:(NSString*)text{
    if (!text || text.length <= 0) {
        return nil;
    }
    
    UIFont *font = [UIFont systemFontOfSize:16];
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [[UIColor lightGrayColor] set];
    UIRectFill(self.bounds);
    [[UIColor blueColor] set];
    [text drawInRect:CGRectMake(10, 10, CGRectGetWidth(self.bounds) - 20, CGRectGetHeight(self.bounds) - 20) withFont:font lineBreakMode:NSLineBreakByWordWrapping];
    CGImageRef cgImage = UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
    
    UIImage *image = [UIImage imageWithCGImage:cgImage scale:1.0 orientation:UIImageOrientationUpMirrored];
    
    return image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
