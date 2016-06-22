# ATPalette

[![CI Status](http://img.shields.io/travis/Aesir/ATPalette.svg?style=flat)](https://travis-ci.org/Aesir/ATPalette)
[![Version](https://img.shields.io/cocoapods/v/ATPalette.svg?style=flat)](http://cocoapods.org/pods/ATPalette)
[![License](https://img.shields.io/cocoapods/l/ATPalette.svg?style=flat)](http://cocoapods.org/pods/ATPalette)
[![Platform](https://img.shields.io/cocoapods/p/ATPalette.svg?style=flat)](http://cocoapods.org/pods/ATPalette)

![](Gif/2016-05-20 21_00_39.gif)


## 安装

下载并解压压缩包,将```UIImageView+GetColorAtPixel/```文件夹下面的两个文件拖入项目中即可.



## 导入

在需要使用的控制器中导入头文件

```objective-c
#import "UIImageView+GetColorAtPixel.h"
```

## 示例代码

传入一个point,返回一个color
```objective-c
// 从UIImageView中获取指定点的UIColor对象
// - (UIColor *)getColorAtPixel:(CGPoint)point;
UIColor *color = [self.palette getColorAtPoint:point];
```
如果触摸点的位置超出了图片,会返回nil,显示出来是黑色,

为了防止出现这种情况,可以简单地封装一下使用:


```objective-c
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

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
```


## 源代码预览


```objective-c
// Get color at pixel from UIImageView
// 从UIImageView中获取指定点的UIColor对象
- (UIColor *)getColorAtPixel:(CGPoint)point{

    // 定义image的Frame方便后面调用
    const CGRect imageFrame = CGRectMake(0.0f, 0.0f,
                                         self.frame.size.width, self.frame.size.height);

    // Cancel if point is outside image coordinates
    // 如果给定的点超出了image的坐标范围, 就返回nil
    if (!CGRectContainsPoint(imageFrame, point)) {
        return nil;
    }

    // Create RGB color space
    // 创建RGB颜色空间
    const CGColorSpaceRef colorSpaceRGB  = CGColorSpaceCreateDeviceRGB();
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,1,1,8,4,colorSpaceRGB,kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpaceRGB);
    CGContextSetBlendMode(context, kCGBlendModeCopy);

    // Draw the pixel we are interested in onto the bitmap context
    // 画像素的位图上下文
    CGContextTranslateCTM(context, -point.x, point.y- self.frame.size.height);
    CGContextDrawImage(context, imageFrame, self.image.CGImage);
    CGContextRelease(context);

    // Convert color values [0..255] to floats [0.0..1.0]
    // 将0~255的char类型数据装换成0~1的float类型数据
    const CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    const CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    const CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    const CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

}
```




## Author

AesirTitan, ayan.bifrost@gmail.com
