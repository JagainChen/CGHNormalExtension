//
//  UIViewController+AlertVC.h
//  HJH
//
//  Created by jagain on 16/7/11.
//  Copyright © 2016年 hjh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(void);

@interface UIViewController (AlertVC)

- (void)presentAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle;
- (void)presentAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock withSecondActionTitle:(NSString *)secondTitle style:(UIAlertActionStyle)secondStyle secondBlock:(ActionBlock)secondBlock;
- (void)presentAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock;
- (void)presentAutoDismissAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock;
- (void)presentColorAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock withSecondActionTitle:(NSString *)secondTitle style:(UIAlertActionStyle)secondStyle secondBlock:(ActionBlock)secondBlock;
- (UIAlertController *)getAlertControllerWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock withSecondActionTitle:(NSString *)secondTitle style:(UIAlertActionStyle)secondStyle secondBlock:(ActionBlock)secondBlock;

/**
 弹出storyboard里的摸个viewController
 */
- (void)pushViewControllerInStoryboard:(NSString *)name WithIdentifier:(NSString *)indetifier;

@end
