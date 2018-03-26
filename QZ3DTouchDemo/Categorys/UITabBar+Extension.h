//
//  UITabBar+Extension.h
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Extension)

- (void)showBadgeOnItemIndex:(int)index andString:(NSString *)number;

- (void)hideBadgeOnItemIndex:(int)index;

- (void)removeBadgeOnItemIndex:(int)index;

@end
