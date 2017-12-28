//
//  SwipeView.m
//  Tap
//
//  Created by 小白 on 16/9/7.
//  Copyright © 2017年 小白. All rights reserved.
//

#import "SwipeView.h"

@implementation SwipeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
        titleL.text = @"轻扫手势";
        [self addSubview:titleL];
        
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.frame.size.width - 100, 200)];
        tapView.backgroundColor = [UIColor greenColor];
        [self addSubview:tapView];
        
        UILabel *showL = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, tapView.frame.size.width, 20)];
        showL.tag = 100;
        showL.userInteractionEnabled = NO;
        [tapView addSubview:showL];
        
        //轻扫手势
        UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [tapView addGestureRecognizer:swipeGestureLeft];
        
        UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
        [tapView addGestureRecognizer:swipeGestureRight];
    }
    return self;
}
#pragma mark --action
- (void)swipeLeft:(id)sender
{
    UISwipeGestureRecognizer *swipe = sender;
    if (swipe.direction ==UISwipeGestureRecognizerDirectionLeft)
    {
        NSLog(@"left");
        UILabel *showL = [swipe.view viewWithTag:100];
        showL.text = @"left";
    }
}
- (void)swipeRight:(id)sender
{
    UISwipeGestureRecognizer *swipe = sender;
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        NSLog(@"right");
        
        UILabel *showL = [swipe.view viewWithTag:100];
        showL.text = @"right";
    }
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
