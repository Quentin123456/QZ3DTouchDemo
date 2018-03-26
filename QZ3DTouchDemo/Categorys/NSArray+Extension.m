//
//  NSArray+Extension.m
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

//数组没有对打印本地化中文做处理
//重写数组本地化打印方法即可
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"(\n"];
    
    for (id obj in self) {//self 就是数组本身
        
        [str appendFormat:@"\t%@,\n", obj];//\t是缩进 \n是换行
    }
    
    [str appendString:@")"];
    
    return str;
}
@end
