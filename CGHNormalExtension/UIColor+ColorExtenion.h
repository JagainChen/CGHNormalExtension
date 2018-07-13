//
//  UIColor+ColorExtenion.h
//  惠多多
//
//  Created by Jagain on 2017/6/9.
//  Copyright © 2017年 Jagain. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CGHColor(r,g,b,alpha) [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha]
#define ColorWithHexString(color) [UIColor colorWith16String:color]

@interface UIColor (ColorExtenion)

+ (UIColor *)colorWith16String:(NSString *)color;


@end
