//
//  UIButton+MaterialDesign.m
//  ATPalette
//
//  Created by Aesir Titan on 2016-05-20.
//  Copyright © 2016 Titan Studio. All rights reserved.
//

#import "UIButton+MaterialDesign.h"

@implementation UIButton (MaterialDesign)

- (void)buttonStatus:(ATButtonStatus)status{
    [self setEnabled:YES];
    switch (status) {
        case ATButtonStatusNormal:
            self.layer.shadowOffset = CGSizeMake(0.0,0.0);
            self.layer.shadowOpacity = 0.2;
            self.layer.shadowRadius = 1.0;
            self.layer.backgroundColor = self.normalColor.CGColor;
            break;
        case ATButtonStatusTap: //
            self.layer.shadowOffset = CGSizeMake(0.0,4.0);
            self.layer.shadowOpacity = 0.3;
            self.layer.shadowRadius = 5.0;
            self.layer.backgroundColor = self.selectedColor.CGColor;
            break;
        case ATButtonStatusSelected: //
            self.selected = YES;
            self.layer.shadowOffset = CGSizeMake(0.0,3.0);
            self.layer.shadowOpacity = 0.2;
            self.layer.shadowRadius = 4.0;
            self.layer.backgroundColor = self.selectedColor.CGColor;
            break;
        case ATButtonStatusDisabled: //
            [self setEnabled:NO];
            self.layer.backgroundColor = self.disabledColor.CGColor;
            self.layer.shadowOffset = CGSizeMake(0.0,0.0);
            self.layer.shadowOpacity = 0.2;
            self.layer.shadowRadius = 0.5;
            break;
    }
}

- (UIColor *)normalColor{
    return [UIColor colorWithRed:0.40f green:0.80f blue:0.98f alpha:1.00f];
}

- (UIColor *)disabledColor{
    return [UIColor colorWithRed:0.70f green:0.90f blue:0.99f alpha:1.00f];
}

- (UIColor *)selectedColor{
    return [UIColor colorWithRed:0.55f green:0.85f blue:0.98f alpha:1.00f];
}

- (void)initMyButton {
    self.layer.opacity = 1.0;
    self.clipsToBounds = NO;
    self.layer.cornerRadius = 3.0;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0,0.0);
    self.layer.backgroundColor = [UIColor colorWithRed:0.42 green:0.8 blue:1 alpha:1].CGColor;
    self.layer.shadowRadius = 0.5;
    [self buttonStatus:ATButtonStatusNormal];
}

@end
