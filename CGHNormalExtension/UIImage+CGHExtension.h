//
//  UIImage+CGHExtension.h
//  惠多多
//
//  Created by Jagain on 2017/6/20.
//  Copyright © 2017年 Jagain. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^GIFimageBlock)(UIImage *GIFImage);

@interface UIImage (CGHExtension)

/** 根据本地GIF图片名 获得GIF image对象 */

+ (UIImage *)imageWithGIFNamed:(NSString *)name;

/** 根据一个GIF图片的data数据 获得GIF image对象 */

+ (UIImage *)imageWithGIFData:(NSData *)data;

/** 根据一个GIF图片的URL 获得GIF image对象 */

+ (void)imageWithGIFUrl:(NSString *)url and:(GIFimageBlock)gifImageBlock;

+(CGSize)getImageSizeWithURL:(id)imageURL;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)compressImage:(UIImage *)image withSize:(CGSize)viewsize;

+ (UIImage *)fixOrientation:(UIImage *)aImage;
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha  image:(UIImage*)image;

@end




