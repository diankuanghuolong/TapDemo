//
//  PanView.m
//  Tap
//
//  Created by Ios_Developer on 2017/12/28.
//  Copyright © 2017年 小白. All rights reserved.
//

#import "PanView.h"

@implementation PanView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
        titleL.text = @"拖动手势";
        [self addSubview:titleL];
        
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.frame.size.width - 100, 200)];
        tapView.backgroundColor = [UIColor greenColor];
        [self addSubview:tapView];
        
        UILabel *showL = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, tapView.frame.size.width, 20)];
        showL.tag = 100;
        showL.userInteractionEnabled = NO;
        [tapView addSubview:showL];
        
        //    拖动手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [tapView addGestureRecognizer:panGesture];
    }
    return self;
}

#pragma mark --action
- (void)panGesture:(id)sender
{
    UIPanGestureRecognizer *panGesture = sender;
    CGPoint movePoint = [panGesture translationInView:self];
    panGesture.view.center = CGPointMake(movePoint.x, movePoint.y);
    NSLog(@"%@",NSStringFromCGPoint(movePoint));
    
    UILabel *showL = [panGesture.view viewWithTag:100];
    showL.text = [[NSString alloc] initWithFormat:@"%@",NSStringFromCGPoint(movePoint)];
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
