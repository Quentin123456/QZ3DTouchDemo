//
//  QZNetCountManager.h
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QZNetCountManager : NSObject

@property(nonatomic,assign) NSInteger netWorkingCount;
@property(nonatomic,assign) NSInteger netGoodsListCount;
@property(nonatomic,assign) NSInteger tokenLostedAlratCount;
@property(nonatomic,assign) BOOL hadAutoLogin;
@property(nonatomic,assign) NSInteger noNetAlratCount;
@property(nonatomic,strong) NSString *  applicationShortcutItemTitle;

+(QZNetCountManager *)sharedNetCountManager;

@end
