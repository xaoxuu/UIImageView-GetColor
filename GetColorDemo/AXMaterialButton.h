//
//  AXMaterialButton.h
//  GetColorDemo
//
//  Created by xaoxuu on 2016-09-15.
//  Copyright © 2016年 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

// Enumeration of button status
// 按钮状态枚举
typedef NS_ENUM(NSUInteger,AXButtonStatus){
    
    // normal
    // 普通
    AXButtonStatusNormal,
    // when the button tapped
    // 高亮
    AXButtonStatusHighLighted,
    
};

@interface AXMaterialButton : UIButton



@end
