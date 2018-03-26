//
//  UIImage+Extension.h
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据颜色 描绘出一个改颜色的  纯色区域
 *
 *  @param color 图片颜色
 *
 *  @return 一个纯色的图片
 */
+ (UIImage*) createImageWithColor: (UIColor*) color;

/**
 *  根据图片名字  自动加载 IOS6 /IOS 7 图片
 *
 *  @param name 图片名字
 *
 *  @return UIIamge
 */
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  图片拉伸
 **/
+ (UIImage *)resizedImage:(NSString *)name;
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

@end
