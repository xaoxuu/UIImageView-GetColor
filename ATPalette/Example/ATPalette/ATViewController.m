//
//  ATViewController.m
//  ATPalette
//
//  Created by Aesir on 05/31/2016.
//  Copyright (c) 2016 Aesir. All rights reserved.
//


#import "ATViewController.h"
#import "UIButton+MaterialDesign.h"
#import "UIImageView+GetColorAtPixel.h"


@interface ATViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *palette;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@end

@implementation ATViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.resetButton initMyButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.palette];
    
    // set background color of view
    // 设置视图背景颜色
    [self getColorAtPoint:point completion:^(UIColor *color) {
        self.view.backgroundColor = color;
    }];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.palette];
    
    // set background color of view
    // 设置视图背景颜色
    [self getColorAtPoint:point completion:^(UIColor *color) {
        self.view.backgroundColor = color;
    }];
    
}

// Access to the specified pixel color, and perform operations
// 获取指定像素点的颜色, 并执行操作
- (void)getColorAtPoint:(CGPoint)point completion:(void(^)(UIColor *color))completion{
    
    CGFloat x = point.x - 0.5*self.palette.frame.size.width - 1;
    CGFloat y = point.y - 0.5*self.palette.frame.size.height - 1;
    CGFloat r = 0.5 * (self.palette.frame.size.width - 20);
    
    // When the touch point is inside palette coordinates.
    // 当触摸点在取色板内部时调用
    if (powf(x,2) + powf(y, 2) < powf(r, 2)) {
        completion([self.palette getColorAtPixel:point]);
    }
    
}

- (IBAction)touchUp:(UIButton *)sender {
    [sender buttonStatus:ATButtonStatusNormal];
}

- (IBAction)touchDown:(UIButton *)sender {
    [sender buttonStatus:ATButtonStatusTap];
}

- (IBAction)tap:(UIButton *)sender {
    self.view.backgroundColor = [UIColor whiteColor];
}




@end



/*
 
 #import "ViewController.h"
 #import "UIButton+MaterialDesign.h"
 #import "UIImageView+GetColorAtPixel.h"
 
 @interface ViewController ()
 @property (weak, nonatomic) IBOutlet UIImageView *palette;
 @property (weak, nonatomic) IBOutlet UIButton *resetButton;
 
 @end
 
 @implementation ViewController
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
 [self.resetButton initMyButton];
 }
 
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 
 -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
 UITouch *touch = [touches anyObject];
 CGPoint point = [touch locationInView:self.palette];
 
 // set background color of view
 // 设置视图背景颜色
 [self getColorAtPoint:point completion:^(UIColor *color) {
 self.view.backgroundColor = color;
 }];
 
 }
 
 -(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
 UITouch *touch = [touches anyObject];
 CGPoint point = [touch locationInView:self.palette];
 
 // set background color of view
 // 设置视图背景颜色
 [self getColorAtPoint:point completion:^(UIColor *color) {
 self.view.backgroundColor = color;
 }];
 
 }
 
 // Access to the specified pixel color, and perform operations
 // 获取指定像素点的颜色, 并执行操作
 - (void)getColorAtPoint:(CGPoint)point completion:(void(^)(UIColor *color))completion{
 
 CGFloat x = point.x - 0.5*self.palette.frame.size.width - 1;
 CGFloat y = point.y - 0.5*self.palette.frame.size.height - 1;
 CGFloat r = 0.5 * (self.palette.frame.size.width - 20);
 
 // When the touch point is inside palette coordinates.
 // 当触摸点在取色板内部时调用
 if (powf(x,2) + powf(y, 2) < powf(r, 2)) {
 completion([self.palette getColorAtPixel:point]);
 }
 
 }
 
 - (IBAction)touchUp:(UIButton *)sender {
 [sender buttonStatus:ATButtonStatusNormal];
 }
 
 - (IBAction)touchDown:(UIButton *)sender {
 [sender buttonStatus:ATButtonStatusTap];
 }
 
 - (IBAction)tap:(UIButton *)sender {
 self.view.backgroundColor = [UIColor whiteColor];
 }
 
 
 @end

*/