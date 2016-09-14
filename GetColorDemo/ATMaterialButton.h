//
//  ATMaterialButton.h
//  GetColorDemo
//
//  Created by Aesir Titan on 2016-09-15.
//  Copyright © 2016年 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATMaterialButton : UIButton

// Enumeration of button status
// 按钮状态枚举
typedef NS_ENUM(NSUInteger,ATButtonStatus){
    
    // normal
    // 普通
    ATButtonStatusNormal,
    // when the button tapped
    // 高亮
    ATButtonStatusHighLighted,
    
};

@end
