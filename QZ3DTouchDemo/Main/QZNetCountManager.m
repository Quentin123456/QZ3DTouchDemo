//
//  QZNetCountManager.m
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import "QZNetCountManager.h"

@implementation QZNetCountManager

+ (QZNetCountManager *)sharedNetCountManager {
    
    static QZNetCountManager * sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[QZNetCountManager alloc] init];
        sharedAccountManagerInstance.netWorkingCount = 0;
        sharedAccountManagerInstance.applicationShortcutItemTitle = @"QZ";
        sharedAccountManagerInstance.hadAutoLogin = NO;
        sharedAccountManagerInstance.tokenLostedAlratCount = 0;
    });
    return sharedAccountManagerInstance;
    
}

@end
