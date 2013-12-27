//
//  MCABoxView.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-24.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCABoxView.h"

const CGFloat kSize = 100;

@interface MCABoxView()
@property (nonatomic) CALayer *topLayer;
@property (nonatomic) CALayer *bottomLayer;
@property (nonatomic) CALayer *frontLayer;
@property (nonatomic) CALayer *backLayer;
@property (nonatomic) CALayer *leftLayer;
@property (nonatomic) CALayer *rightLayer;
@end

@implementation MCABoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        // Initialization code
        CATransform3D transform = CATransform3DIdentity;
    
        transform = CATransform3DMakeTranslation(0, -kSize / 2, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
        self.topLayer = [self layerWithTransform:transform andColor:[UIColor redColor]];
        [self.layer addSublayer:self.topLayer];
        
        transform = CATransform3DMakeTranslation(0, kSize / 2, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
        self.bottomLayer = [self layerWithTransform:transform andColor:[UIColor blueColor]];
        [self.layer addSublayer:self.bottomLayer];
        
        transform = CATransform3DMakeTranslation(0, 0, kSize / 2);
        self.frontLayer = [self layerWithTransform:transform  andColor:[UIColor whiteColor]];
        [self.layer addSublayer:self.frontLayer];
        
        transform = CATransform3DMakeTranslation(0, 0, -kSize / 2);
        self.backLayer = [self layerWithTransform:transform andColor:[UIColor blackColor]];
        [self.layer addSublayer:self.backLayer];
        
        transform = CATransform3DMakeTranslation(-kSize / 2, 0, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
        self.leftLayer = [self layerWithTransform:transform andColor:[UIColor yellowColor]];
        [self.layer addSublayer:self.leftLayer];
        
        transform = CATransform3DMakeTranslation(kSize / 2, 0, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
        self.rightLayer = [self layerWithTransform:transform andColor:[UIColor greenColor]];
        [self.layer addSublayer:self.rightLayer];
        
        self.layer.sublayerTransform = [self perspectiveTransform];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (CALayer*)layerWithTransform:(CATransform3D)transform andColor:(UIColor*)color{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, kSize, kSize);
    layer.position = self.center;
    layer.backgroundColor = color.CGColor;
    layer.transform = transform;
    
    return layer;
}

- (CATransform3D)perspectiveTransform{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 2000;
    
    return transform;
}

@end
