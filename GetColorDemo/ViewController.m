//
//  ViewController.m
//  GetColorDemo
//
//  Created by Aesir Titan on 2016-09-15.
//  Copyright © 2016年 Titan Studio. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+ATGetColor.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *palette;


@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.palette];
    
    // set background color of view
    // 设置视图背景颜色
    [self.palette at_getColorFromCircleWithPoint:point completion:^(UIColor * _Nonnull color) {
        self.view.backgroundColor = color;
    }];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.palette];
    
    // set background color of view
    // 设置视图背景颜色
    [self.palette at_getColorFromCircleWithPoint:point completion:^(UIColor * _Nonnull color) {
        self.view.backgroundColor = color;
    }];
    
}


- (IBAction)reset:(UIButton *)sender {
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
