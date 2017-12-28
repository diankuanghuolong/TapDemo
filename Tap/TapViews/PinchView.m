//
//  PinchView.m
//  Tap
//
//  Created by Ios_Developer on 2017/12/28.
//  Copyright © 2017年 小白. All rights reserved.
//

#import "PinchView.h"

@implementation PinchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
        titleL.text = @"捏合手势";
        [self addSubview:titleL];
        
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.frame.size.width - 100, 200)];
        tapView.backgroundColor = [UIColor greenColor];
        [self addSubview:tapView];
        
        //    捏合手势
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
        [tapView addGestureRecognizer:pinchGesture];
    }
    return self;
}
#pragma mark --action
- (void)pinchGesture:(id)sender
{
    UIPinchGestureRecognizer *pinchGesture = sender;
    if (pinchGesture.state == UIGestureRecognizerStateChanged)
    {
        pinchGesture.view.transform = CGAffineTransformMakeScale(pinchGesture.scale, pinchGesture.scale);
    }
    if (pinchGesture.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.5 animations:^{
            pinchGesture.view.transform = CGAffineTransformIdentity;
        }];
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
