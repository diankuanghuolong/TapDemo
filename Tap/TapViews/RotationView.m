//
//  RotationView.m
//  Tap
//
//  Created by Ios_Developer on 2017/12/28.
//  Copyright © 2017年 小白. All rights reserved.
//

#import "RotationView.h"

@interface RotationView ()

@end
@implementation RotationView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
        titleL.text = @"旋转手势";
        [self addSubview:titleL];
        
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.frame.size.width - 100, 200)];
        tapView.userInteractionEnabled = YES;
        tapView.backgroundColor = [UIColor greenColor];
        [self addSubview:tapView];
        
        //    旋转手势
        UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGesture:)];
        [tapView addGestureRecognizer:rotationGesture];
    }
    return self;
}

#pragma mark --action
- (void)rotationGesture:(id)sender
{
    UIRotationGestureRecognizer *rotationGesture = sender;
    if (rotationGesture.state == UIGestureRecognizerStateChanged)
    {
        rotationGesture.view.transform = CGAffineTransformMakeRotation(rotationGesture.rotation);
    }
    if (rotationGesture.state ==UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:1 animations:^{
            rotationGesture.view.transform = CGAffineTransformIdentity;
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
