//
//  TapView.m
//  Tap
//
//  Created by 小白 on 16/9/7.
//  Copyright © 2017年 小白. All rights reserved.
//

#import "TapView.h"

@implementation TapView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
        titleL.text = @"轻击手势";
        [self addSubview:titleL];
        
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.frame.size.width - 100, 200)];
        tapView.backgroundColor = [UIColor greenColor];
        [self addSubview:tapView];
        
        UILabel *showL = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, tapView.frame.size.width, 20)];
        showL.tag = 100;
        showL.userInteractionEnabled = NO;
        [tapView addSubview:showL];
        
        //轻击手势
        [self addSubview:tapView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [tapView addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark --action
- (void)tap:(id)sender
{
    NSLog(@"tap");
    UITapGestureRecognizer *tap = sender;
    UILabel *showL = [tap.view viewWithTag:100];
    showL.text = @"tap";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIView *view = [touches anyObject].view;
    if (view == self)
    {
        [self removeFromSuperview];
    }
}

@end
