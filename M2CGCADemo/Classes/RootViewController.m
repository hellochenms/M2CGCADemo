//
//  RootViewController.m
//  M2CGCADemo
//
//  Created by Chen Meisong on 13-12-20.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *_sections;
    NSArray *_rows;
    UITableView *_tableView;
}

@end

@implementation RootViewController
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        _sections = @[@"UIKit", @"CG", @"CA"];
        _rows = @[
                  @[
                      @[@"UIKit绘图", @"MUIDrawViewController"],
                      @[@"变形", @"MUITransformViewController"]
                      ],
                  @[
                      @[@"像素对齐", @"MCGPixelAlignViewController"],
                      @[@"CG例子", @"MCGSampleViewController"],
                      @[@"文字生成image",@"MCGImageViewController"]
                      ],
                  @[
                      @[@"SimpleSample", @"MCASSViewController"],
                      @[@"DrawLayers", @"MCADrawLayerViewController"],
                      @[@"隐式动画事务", @"ImplicitViewController"],
                      @[@"防止闪回", @"MCANoJumpBackViewController"],
                      @[@"Actions", @"MCAActionViewController"],
                      @[@"自定义属性的动画", @"MCACustomPropertyViewController"],
                      @[@"3D动画", @"MCA3DViewController"]
                      ]
                  ];
    }
    return self;
}

- (void)loadView{
    self.view = [UIView new];
    
    CGRect frame = [UIScreen mainScreen].bounds;
//    float modifier = isios7 ? 20 : 0;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 20 - 44)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = randomColor;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sections.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *sectionLabel = [UILabel new];
    sectionLabel.backgroundColor = randomColor;
    sectionLabel.text = [_sections objectAtIndex:section];
    
    return sectionLabel;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray*)[_rows objectAtIndex:section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [((NSArray*)[_rows objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row][0];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *ctrl = [NSClassFromString([((NSArray*)[_rows objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row][1]) new];
    if (ctrl) {
        [self.navigationController pushViewController:ctrl animated:YES];
    }
}

@end
