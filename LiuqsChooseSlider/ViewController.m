//
//  ViewController.m
//  LiuqsChooseSlider
//
//  Created by liuqs on 2018/1/29.
//  Copyright © 2018年 liuqs. All rights reserved.
//

#import "ViewController.h"
#import "LiuqsChooseSliderView.h"

// 屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
// 屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define viewH  100

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    LiuqsChooseSliderView *chooseView = [[LiuqsChooseSliderView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - viewH, SCREEN_WIDTH, viewH)];
    chooseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:chooseView];
}




@end
