//
//  NSString+CGHExtension.h
//  惠多多
//
//  Created by Jagain on 2017/6/9.
//  Copyright © 2017年 Jagain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CGHExtension)

/**
 * @brief 拨打电话.
 */
- (void)callPhone;

/**
 * @brief MD5加密.
 */
- (NSString *)md5Screct;

/**
 * @brief 得到字符串的拼音.
 */
- (NSString *)transformToPinYin;

/**
 * @brief 判断字符是否是手机号.
 *
 * @return 是否.
 */
- (BOOL)isMobileNumber;


/**
 * @brief 是否有的特殊字符：,.，。!%œ∑®†øπåß∂ƒ©˙∆˚¬…æΩ≈ç√∫µ≤≥÷«~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。.
 *
 * @return 是否含有.
 */
- (BOOL)isIncludeSpecialCharact;

/**
 * @brief 判断字符内是否含有表情.
 *
 * @return 是否含有.
 */
- (BOOL)stringContainsEmoji;

/**
 * @brief 是否字符都是数字.
 *
 * @return 是否含有.
 */
- (BOOL)isAllNumber;

/**
 * @brief 是否字符都是数字或加减号.
 *
 * @return 是否含有.
 */
- (BOOL)isAllNumberOrAddOrDecrese;



@end
