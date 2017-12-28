//
//  LongView.m
//  Tap
//
//  Created by 小白 on 16/9/7.
//  Copyright © 2017年 小白. All rights reserved.
//

#import "LongPressView.h"

@implementation LongPressView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
        titleL.text = @"长按手势";
        [self addSubview:titleL];
        
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.frame.size.width - 100, 200)];
        tapView.backgroundColor = [UIColor greenColor];
        [self addSubview:tapView];
        
        //    长按手势
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGesture:)];
        longGesture.minimumPressDuration = 0.5;
        [tapView addGestureRecognizer:longGesture];
        
        UILabel *showL = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, tapView.frame.size.width, 20)];
        showL.tag = 100;
        showL.userInteractionEnabled = NO;
        [tapView addSubview:showL];
    }
    return self;
}

#pragma mark --action
- (void)longGesture:(id)sender
{
    UILongPressGestureRecognizer *longGesture = sender;
    if (longGesture.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"long");
        UILabel *showL = [longGesture.view viewWithTag:100];
        showL.text = @"long";
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
