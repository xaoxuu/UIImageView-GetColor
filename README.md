

[![](https://github.com/xaoxuu/AXKit/raw/master/resources/icons/header.png)](https://github.com/xaoxuu/AXKit)

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/AesirTitan/ATKit/master/LICENSE) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](http://img.shields.io/cocoapods/v/ATKit.svg?style=flat)](http://cocoapods.org/?q=ATKit) [![CocoaPods](http://img.shields.io/cocoapods/p/ATKit.svg?style=flat)](http://cocoapods.org/?q=ATKit) [![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 


# UIImageView+GetColor


![](Resources/2016-05-20 21_00_39.gif)

## 安装

下载并解压压缩包,将```UIImageView+GetColor/```文件夹下面的两个文件拖入项目中即可.

>  **注意：**这个仓库不再更新，要获取最新版本，请使用 [**ATKit**](https://github.com/AesirTitan/ATKit) 框架。
>
>  **注意：**这篇文档也不再更新，最新版本的文档在 [**简书@AesirTitan**](http://www.jianshu.com/p/829624b5ffe1) 。



## 功能

### 1. 从指定点获取RGBA值（最原始最暴力的方法，不推荐用）

```objective-c
- (void)at_getRed:(nullable CGFloat *)red green:(nullable CGFloat *)green blue:(nullable CGFloat *)blue alpha:(nullable CGFloat *)alpha withPoint:(CGPoint)point;
```

方法的实现如下：

```objective-c
// get red green blue alpha with point
- (void)at_getRed:(nullable CGFloat *)red green:(nullable CGFloat *)green blue:(nullable CGFloat *)blue alpha:(nullable CGFloat *)alpha withPoint:(CGPoint)point{
    // ==================== [ filter ] ==================== //
    // frame of image
    const CGRect imageFrame = CGRectMake(0.0f, 0.0f,
                                         self.frame.size.width, self.frame.size.height);
    // Cancel if point is outside image coordinates
    if (!CGRectContainsPoint(imageFrame, point)) {
        return;
    }
    
    // ==================== [ function ] ==================== //
    // Create RGB color space
    const CGColorSpaceRef colorSpaceRGB  = CGColorSpaceCreateDeviceRGB();
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,1,1,8,4,colorSpaceRGB,kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpaceRGB);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -point.x, point.y- self.frame.size.height);
    CGContextDrawImage(context, imageFrame, self.image.CGImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    *red   = (CGFloat)pixelData[0] / 255.0f;
    *green = (CGFloat)pixelData[1] / 255.0f;
    *blue  = (CGFloat)pixelData[2] / 255.0f;
    *alpha = (CGFloat)pixelData[3] / 255.0f;
    
}
```

前面说了，很多博客都是粗暴地copy了这一段核心代码，如果你想自己封装，拿走这一段代码就可以了。（UIImageView的Category）

调用起来是这样的：

```objective-c
// 已知imageView、point
CGFloat r,g,b,a;
[imageView at_getRed:&r green:&g blue:&b alpha:&a withPoint:point];
// 然后r/g/b/a就有了值
```

需要自己创建变量，然后把地址传进去，然后才能用。

### 2. 从指定点获取RGBA值，并在block中执行操作

加了一个block，调用起来就方便地多

```objective-c
- (void)at_getRGBAWithPoint:(CGPoint)point completion:(void(^)(CGFloat red,CGFloat green,CGFloat blue,CGFloat alpha))completion;
```

调用起来是这样的：

```objective-c
// 已知imageView、point
[imageView at_getRGBAWithPoint:point completion:^(CGFloat red,CGFloat green,CGFloat blue,CGFloat alpha){
  // 在这里直接用red/green/blue/alpha
}];
```

优点是不需要自己创建变量，直接调用方法，在block回调里直接获得red/green/blue/alpha值。



##### ——但是，很多时候，我们用的取色器是圆形的，那么



### 3. 从圆形范围内的指定点获取RGBA值，并在block中执行操作

```objective-c
- (void)at_getRGBAFromCircleWithPoint:(CGPoint)point completion:(void (^)(CGFloat red,CGFloat green,CGFloat blue,CGFloat alpha))completion;
```

调用起来是这样的：

```objective-c
// 已知imageView、point
[imageView at_getRGBAFromCircleWithPoint:point completion:^(CGFloat red,CGFloat green,CGFloat blue,CGFloat alpha){
  // 在这里直接用red/green/blue/alpha
}];
```

跟第2种调用方法一模一样，但是区别是超出圆形范围之后就不再执行block回调了，这是一种**安全**的做法。

如果不用block方式，那么即使超出了圆形范围，也一定会返回对应的rgba值，会造成不想要的后果。

block的回调机制巧妙地解决了这个问题。



##### ——但是，如果我想直接获得一个UIColor对象呢，跟获取RGBA一样有三种方法。



### 4. 从指定点获取UIColor对象（最原始最暴力的方法，不推荐用）

```objective-c
- (nullable UIColor *)at_getColorWithPoint:(CGPoint)point;
```

调用起来是这样的：

```objective-c
// 已知imageView、point
UIColor *color = [imageView at_getColorWithPoint:point];
// 获得UIColor对象
```

由声明可以看出来，返回的值是一个可空类型，因此这跟第一种方法一样是**不安全**的。



### 5. 从指定点获取UIColor对象，并在block中执行操作

```objective-c
- (void)at_getColorWithPoint:(CGPoint)point completion:(void(^)(UIColor *color))completion;
```

调用起来是这样的：

```objective-c
// 已知imageView、point
[imageView at_getColorWithPoint:point completion:^(UIColor *color){
  // 在这里直接用color
}];
```

这种方法比第4种要方便一些，如果超出UIImageView的时候就不执行block里的代码。



### 6. 从圆形范围内的指定点获取UIColor对象，并在block中执行操作

```objective-c
- (void)at_getColorFromCircleWithPoint:(CGPoint)point completion:(void (^)(UIColor *color))completion;
```

调用起来是这样的：

```objective-c
// 已知imageView、point
[imageView at_getColorFromCircleWithPoint:point completion:^(UIColor *color){
  // 在这里直接用color
}];
```

引言中的Demo用的就是这一种方法，在圆形取色器中取色，既方便又安全。





> 由于工作原因，没有太多时间来封装，这个类目前还比较简陋，仅仅满足最常用情况。
>
> 作者乐于分享，转载请注明出处。喜欢的朋友不妨去 [**GitHub**](https://github.com/AesirTitan/ATKit) 给小弟赏一个 Star ⭐️