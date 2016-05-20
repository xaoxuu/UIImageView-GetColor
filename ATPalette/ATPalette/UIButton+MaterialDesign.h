//
//  UIButton+MaterialDesign.h
//  ATPalette
//
//  Created by Aesir Titan on 2016-05-20.
//  Copyright © 2016 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MaterialDesign)

// Enumeration of button status
// 按钮状态枚举
typedef NS_ENUM(NSUInteger,ATButtonStatus){
    
    // normal
    // 按钮弹起
    ATButtonStatusNormal,
    // when the button tapped
    // 按钮按下
    ATButtonStatusTap,
    // when the button is selected
    // 按钮选中
    ATButtonStatusSelected,
    // when the button is disabled
    // 按钮不可用
    ATButtonStatusDisabled
    
};

/**
 *	@author Aesir Titan, 2016-05-20 19:05:37
 *
 *	@brief Set the button style of different status
 *
 *	@param status  button status
 */
- (void)buttonStatus:(ATButtonStatus)status;

- (void)initMyButton;

@end
