//
//  MCAActionViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-23.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "MCAActionViewController.h"

@interface MCAActionViewController (){
    BOOL _isInLayerTree;
}
@property (nonatomic) CALayer *leftLayer;
@property (nonatomic) CALayer *middleLayer;
@end

@implementation MCAActionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton *startAnimaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startAnimaButton.frame = CGRectMake(10, 10, 300, 50);
    startAnimaButton.backgroundColor = [UIColor blueColor];
    startAnimaButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [startAnimaButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [startAnimaButton addTarget:self action:@selector(onTapStartAnima) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startAnimaButton];
    
    self.leftLayer = [CALayer layer];
    self.leftLayer.frame = CGRectMake(10, CGRectGetMaxY(startAnimaButton.frame) + 10, 30, 30);
    self.leftLayer.backgroundColor = [UIColor redColor].CGColor;
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.duration = 2;
    NSMutableDictionary *actions = [NSMutableDictionary dictionaryWithDictionary:[self.leftLayer actions]];
    [actions setObject:anim forKey:@"position"];
    self.leftLayer.actions = actions;
    
    [self.view.layer addSublayer:self.leftLayer];
    
    UIButton *addOrRemoveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addOrRemoveButton.frame = CGRectMake(10, CGRectGetMaxY(self.leftLayer.frame) + 10, 300, 50);
    addOrRemoveButton.backgroundColor = [UIColor blueColor];
    addOrRemoveButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [addOrRemoveButton setTitle:@"添加/删除Layer" forState:UIControlStateNormal];
    [addOrRemoveButton addTarget:self action:@selector(onTapAddOrRemove) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addOrRemoveButton];
    
    self.middleLayer = [CALayer layer];
    self.middleLayer.frame = CGRectMake(10, CGRectGetMaxY(addOrRemoveButton.frame) + 10, 30, 30);
    self.middleLayer.backgroundColor = [UIColor redColor].CGColor;
    NSMutableDictionary *middleActions = [NSMutableDictionary dictionaryWithDictionary:[self.middleLayer actions]];
    [middleActions setObject:[self inAnims] forKey:kCAOnOrderIn];
    [middleActions setObject:[self outAimas] forKey:kCAOnOrderOut];//TODO:为什么out没效果
    self.middleLayer.actions = middleActions;
}

- (void)onTapStartAnima{
    self.leftLayer.position = CGPointMake(arc4random() % 280 + 20, arc4random() % 400 + 60);
}

- (void)onTapAddOrRemove{
    if (_isInLayerTree) {
        [self.middleLayer removeFromSuperlayer];
    }else{
        [self.view.layer addSublayer:self.middleLayer];
    }
    _isInLayerTree = !_isInLayerTree;
}

- (CAAnimationGroup*)inAnims{
    CABasicAnimation *inFadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    inFadeAnim.fromValue = @0;
    inFadeAnim.toValue = @1;
    CABasicAnimation *inScaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    inScaleAnim.fromValue = @0;
    inScaleAnim.toValue = @1;
    CAAnimationGroup *inAnimGroup = [CAAnimationGroup animation];
    inAnimGroup.animations = @[inFadeAnim, inScaleAnim];
    inAnimGroup.duration = 0.25;
    
    return inAnimGroup;
}
- (CAAnimationGroup*)outAimas{
    CABasicAnimation *outFadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    outFadeAnim.fromValue = @1;
    outFadeAnim.toValue = @0;
    CABasicAnimation *outScaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    outScaleAnim.fromValue = @1;
    outScaleAnim.toValue = @0;
    CAAnimationGroup *addAnimGroup = [CAAnimationGroup animation];
    addAnimGroup.animations = @[outFadeAnim, outScaleAnim];
    addAnimGroup.duration = 0.25;
    
    return addAnimGroup;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
