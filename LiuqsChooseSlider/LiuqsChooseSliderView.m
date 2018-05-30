//
//  LiuqsChooseSliderView.m
//  LiuqsChooseSlider
//
//  Created by liuqs on 2018/1/29.
//  Copyright © 2018年 liuqs. All rights reserved.
//

#import "LiuqsChooseSliderView.h"

// 屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
// 屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface LiuqsChooseSliderView ()

@property(nonatomic, strong)UIView *baseLineView;

@property(nonatomic, strong)UILabel *labels;

@property(nonatomic, strong)UIImageView *controlPoint;

@end

@implementation LiuqsChooseSliderView

- (UIImageView *)controlPoint {
    if (!_controlPoint) {
        _controlPoint = [[UIImageView alloc]init];
        _controlPoint.frame = CGRectMake(20 + (SCREEN_WIDTH - 60) / 6.f, 47, 26, 26);
        _controlPoint.backgroundColor = [UIColor colorWithRed:36.0/255.f green:159.0/255.f  blue:244.0/255.f  alpha:1.0f];
        _controlPoint.layer.cornerRadius = 13;
        _controlPoint.layer.masksToBounds = YES;
        _controlPoint.userInteractionEnabled = YES;
        [self setShadowForView:_controlPoint];
        //给小点设置拖拽手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
        [_controlPoint addGestureRecognizer:panGesture];
    }
    return _controlPoint;
}

- (UIView *)baseLineView {
    if (!_baseLineView) {
        _baseLineView = [[UIView alloc]init];
        UIColor *color = [UIColor colorWithRed:81.0/255.0 green:81.0/255.0 blue:81.0/255.0 alpha:1.0];
        _baseLineView.backgroundColor = color;
        _baseLineView.frame = CGRectMake(30, 60, SCREEN_WIDTH - 60, 0.5);
        for (int i = 0; i < 7; i++) {
            UIView *line = [[UIView alloc]init];
            line.backgroundColor = color;
            line.frame = CGRectMake(30 + i * (SCREEN_WIDTH - 60) / 6.f, 55, 0.5, 10);
            [self addSubview:line];
        }
    }
    return _baseLineView;
}

- (UILabel *)labels {
    if (!_labels) {
        _labels = [[UILabel alloc]init];
        _labels.frame = CGRectMake(15, 25, 30, 15);
        _labels.font = [UIFont boldSystemFontOfSize:16.f];
        _labels.textAlignment = NSTextAlignmentCenter;
        _labels.text = @"A";
        UILabel *standard = [[UILabel alloc]init];
        standard.frame = CGRectMake(10 + (SCREEN_WIDTH - 60) / 6.f, 20, 40, 20);
        standard.font = [UIFont boldSystemFontOfSize:17.f];
        standard.textAlignment = NSTextAlignmentCenter;
        standard.text = @"标准";
        [self addSubview:standard];
        UILabel *max = [[UILabel alloc]init];
        max.frame = CGRectMake(SCREEN_WIDTH - 20 - 30, 20, 40, 20);
        max.font = [UIFont boldSystemFontOfSize:22.f];
        max.textAlignment = NSTextAlignmentCenter;
        max.text = @"A";
        [self addSubview:max];
    }
    return _labels;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addSubview:self.baseLineView];
        [self addSubview:self.labels];
        [self addSubview:self.controlPoint];
        [self addActions];
    }
    return self;
}

- (void)addActions {
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
    [self addGestureRecognizer:tap];
}

//处理单击手势
- (void)onTap:(UITapGestureRecognizer *)tap {
    CGPoint locationPoint = [tap locationInView:self.self];
    if (locationPoint.x >= 28 && locationPoint.x <= self.frame.size.width - 28) {
        if (tap.state == UIGestureRecognizerStateEnded) {
            [self changeControlWithPoint:locationPoint];
        }
    }
}

//处理拖拽手势
- (void)panGesture:(UIPanGestureRecognizer *)pan {
    CGPoint locationPoint = [pan locationInView:self];
    if (locationPoint.x >= 28 && locationPoint.x <= self.frame.size.width - 28) {
        self.controlPoint.center = CGPointMake(locationPoint.x, self.baseLineView.center.y);
        if (pan.state == UIGestureRecognizerStateEnded) {
            [self changeControlWithPoint:locationPoint];
        }
    }
}

- (void)changeControlWithPoint:(CGPoint)locationPoint {
    CGFloat X = locationPoint.x;
    CGFloat lineW = (SCREEN_WIDTH - 60);
    CGFloat onePointX   = 28;
    CGFloat twoPointX   = 30 + lineW / 12.f;
    CGFloat threePointX = 30 + lineW / 12.f * 3.f;
    CGFloat fourPonitX  = 30 + lineW / 12.f * 5;
    CGFloat fivePointX  = 30 + lineW / 12.f * 7;
    CGFloat sixPointX   = 30 + lineW / 12.f * 9;
    CGFloat sevenPointX = 30 + lineW / 12.f * 11;
    CGFloat pointY = self.baseLineView.center.y;
    if (X >= onePointX && X < twoPointX) {
        self.controlPoint.center = CGPointMake(30, pointY);
    }else if (X >= twoPointX && X < threePointX) {
        self.controlPoint.center = CGPointMake(30 + lineW / 6.f, pointY);
    }else if (X >= threePointX && X < fourPonitX) {
        self.controlPoint.center = CGPointMake(30 + lineW / 6.f * 2, pointY);
    }else if (X>= fourPonitX && X < fivePointX) {
        self.controlPoint.center = CGPointMake(30 + lineW / 6.f * 3, pointY);
    }else if (X >= fivePointX && X < sixPointX) {
        self.controlPoint.center = CGPointMake(30 + lineW / 6.f * 4, pointY);
    }else if(X >= sixPointX && X < sevenPointX) {
        self.controlPoint.center = CGPointMake(30 + lineW / 6.f * 5, pointY);
    }else {
       self.controlPoint.center  = CGPointMake(30 + lineW / 6.f * 6, pointY);
    }
}


//给视图加阴影
- (void)setShadowForView:(UIView *)view {
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,-3);
    view.layer.shadowOpacity = 0.1;
    view.layer.shadowRadius = 2;
}




@end
