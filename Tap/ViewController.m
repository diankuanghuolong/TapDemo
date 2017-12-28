//
//  ViewController.m
//  Tap
//
//  Created by 小白 on 16/9/7.
//  Copyright © 2016年 小白. All rights reserved.
//

#import "ViewController.h"
#import "TapView.h"
#import "SwipeView.h"
#import "LongPressView.h"
#import "PinchView.h"
#import "PanView.h"
#import "RotationView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    轻击手势（TapGestureRecognizer）
//    轻扫手势 （SwipeGestureRecognizer）
//    长按手势（LongPressGestureRecognizer）
//    捏合手势（PinchGestureRecognizer）
//    拖动手势（PanGestureRecognizer）
//    旋转手势（RotationGestureRecognizer）
    /*
     小伙子，如果你要在模拟器上测试的话，记得，右键点住手势的view，按下option然后操作。不然你一定😫
    */
    
    
    NSArray *titleArr = @[@"轻击手势",@"轻扫手势",@"长按手势",@"捏合手势",@"拖动手势",@"旋转手势"];
    CGFloat x = 100 , y = 100,w = 80, h = 30;
    for (int i = 0; i < titleArr.count; i ++)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = 10 + i;
        [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        y += h + 5;
    }
}
#pragma mark --action
-(void)didClick:(UIButton *)sender
{
    switch (sender.tag - 10)
    {
        case 0:
            {
                TapView *tapView = [[TapView alloc] initWithFrame:self.view.bounds];
                [self.view addSubview:tapView];
            }
            break;
        case 1:
        {
            SwipeView *tapView = [[SwipeView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:tapView];
        }
            break;
        case 2:
        {
            LongPressView *tapView = [[LongPressView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:tapView];
        }
            break;
        case 3:
        {
            PinchView *tapView = [[PinchView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:tapView];
        }
            break;
        case 4:
        {
            PanView *tapView = [[PanView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:tapView];
        }
            break;
        case 5:
        {
            RotationView *tapView = [[RotationView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:tapView];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
