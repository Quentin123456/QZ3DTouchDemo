//
//  UITextView+Extension.m
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import "UITextView+Extension.h"

@implementation UITextView (Extension)

//禁用 全选复制粘贴
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    if ([UIMenuController sharedMenuController]) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
    
}

@end
