//
//  UIViewController+AlertVC.m
//  HJH
//
//  Created by jagain on 16/7/11.
//  Copyright © 2016年 hjh. All rights reserved.
//

#import "UIViewController+AlertVC.h"

typedef void(^ActionHandler)(UIAlertAction *);

@implementation UIViewController (AlertVC)

- (void)presentAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle {
    [self presentAlertVCWithTitle:title withSubTitle:subTitle withFirstActionTitle:nil style:UIAlertActionStyleDefault firstBlock:nil withSecondActionTitle:nil style:UIAlertActionStyleDefault secondBlock:nil dismissAfterDelay:1];
}

- (void)presentAutoDismissAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock
{
    [self presentAlertVCWithTitle:title withSubTitle:subTitle withFirstActionTitle:firstTitle style:firstStyle firstBlock:firstBlock withSecondActionTitle:nil style:UIAlertActionStyleDefault secondBlock:nil dismissAfterDelay:3];
}

- (void)presentAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock {
    [self presentAlertVCWithTitle:title withSubTitle:subTitle withFirstActionTitle:firstTitle style:firstStyle firstBlock:firstBlock withSecondActionTitle:nil style:UIAlertActionStyleDefault secondBlock:nil dismissAfterDelay:MAXFLOAT];
}

- (void)presentAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock withSecondActionTitle:(NSString *)secondTitle style:(UIAlertActionStyle)secondStyle secondBlock:(ActionBlock)secondBlock {
    [self presentAlertVCWithTitle:title withSubTitle:subTitle withFirstActionTitle:firstTitle style:firstStyle firstBlock:firstBlock withSecondActionTitle:secondTitle style:secondStyle secondBlock:secondBlock dismissAfterDelay:MAXFLOAT];
}

- (void)presentAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock withSecondActionTitle:(NSString *)secondTitle style:(UIAlertActionStyle)secondStyle secondBlock:(ActionBlock)secondBlock dismissAfterDelay:(NSTimeInterval)delay{
    UIAlertController *alertControll = [UIAlertController alertControllerWithTitle:title message:subTitle preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *firstAction = [self alertActionWithTitle:firstTitle style:firstStyle block:firstBlock];
    
    UIAlertAction *secondAction = [self alertActionWithTitle:secondTitle style:secondStyle block:secondBlock];
    
    [alertControll addAction:firstAction];
    if (secondAction) {
        [alertControll addAction:secondAction];
    }
    
    [self presentViewController:alertControll animated:YES completion:^{
        
    }];
    
    [self performSelector:@selector(dismissViewController:) withObject:alertControll afterDelay:delay];
}


- (void)presentColorAlertVCWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock withSecondActionTitle:(NSString *)secondTitle style:(UIAlertActionStyle)secondStyle secondBlock:(ActionBlock)secondBlock {
    
    UIAlertController *alertControll = [self getAlertControllerWithTitle:title withSubTitle:subTitle withFirstActionTitle:firstTitle style:firstStyle firstBlock:firstBlock withSecondActionTitle:secondTitle style:secondStyle secondBlock:secondBlock];
    
    [self presentViewController:alertControll animated:YES completion:^{
        
    }];
}

- (UIAlertController *)getAlertControllerWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withFirstActionTitle:(NSString *)firstTitle style:(UIAlertActionStyle)firstStyle firstBlock:(ActionBlock)firstBlock withSecondActionTitle:(NSString *)secondTitle style:(UIAlertActionStyle)secondStyle secondBlock:(ActionBlock)secondBlock{
    UIAlertController *alertControll = [UIAlertController alertControllerWithTitle:title message:subTitle preferredStyle:UIAlertControllerStyleAlert];
    //修改message
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:subTitle];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith16String:@"ec283f"] range:NSMakeRange(0, subTitle.length)];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, subTitle.length)];
    
    //    if ([alertControll valueForKey:@"_attributedMessage"]) {
    [alertControll setValue:alertControllerMessageStr forKey:@"attributedMessage"];
    //    }
    
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:firstTitle style:firstStyle handler:^(UIAlertAction * _Nonnull action) {
        if (firstBlock) {
            firstBlock();
        }
    }];
    
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:secondTitle style:secondStyle handler:^(UIAlertAction * _Nonnull action) {
        if (secondBlock) {
            secondBlock();
        }
    }];
    
    [alertControll addAction:firstAction];
    [alertControll addAction:secondAction];
    
    return alertControll;
}

- (void)dismissViewController:(UIAlertController *)vc {
    if (vc.actions.count > 0) {
        UIAlertAction *firstAction = vc.actions[0];
        ActionHandler object = [firstAction valueForKey:@"_handler"];
        if (object) {
            object(firstAction);
        }
        
    }
    [vc dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIAlertAction *)alertActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style block:(ActionBlock)block{
    if (title.length <= 0) {
        return nil;
    }
    return [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }];
}

- (void)pushViewControllerInStoryboard:(NSString *)name WithIdentifier:(NSString *)indetifier{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:name bundle:NULL];
    UITableViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:indetifier];
    vc.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:vc animated:YES];
}


@end
