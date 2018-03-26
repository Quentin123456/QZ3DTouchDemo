//
//  AppDelegate.m
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import "AppDelegate.h"
#import "QZTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1.创建窗口
    self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[QZTabBarController alloc] init];
    [self.window makeKeyAndVisible];
    
    [self configShortCutItems];
    
    // Override point for customization after application launch.
    return YES;
}

/** 创建shortcutItems */
- (void)configShortCutItems {
    
    NSMutableArray *shortcutItems = [NSMutableArray array];
    
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"QZ.UITouchText.home" localizedTitle:@"测试1" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome] userInfo:nil];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"QZ.UITouchText.search" localizedTitle:@"测试2" localizedSubtitle:@"测试2副标题" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch]
                                                                             userInfo:nil];
    [shortcutItems addObject:item2];
    [shortcutItems addObject:item1];
    [[UIApplication sharedApplication] setShortcutItems:shortcutItems];
    
}

// iOS9 的 3D Touch
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 &&self.window.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        
        QZLog(@"你的手机支持3D Touch!");
        QZNetCountManager * sharedNetCountManager = [QZNetCountManager sharedNetCountManager];
        sharedNetCountManager.applicationShortcutItemTitle = shortcutItem.type;
        
        //首页
        if([shortcutItem.type isEqualToString:@"QZ.UITouchText.home"]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"QZ.UITouchText.home" object:nil userInfo:nil];
            
        }
        //搜索商品
        if([shortcutItem.type isEqualToString:@"QZ.UITouchText.search"]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"QZ.UITouchText.search" object:nil userInfo:nil];
            
        }
        //购物车
        if([shortcutItem.type isEqualToString:@"YPYD.UITouchText.cart"]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"QZ.UITouchText.cart" object:nil userInfo:nil];
            
        }
        //我的U
        if([shortcutItem.type isEqualToString:@"QZ.UITouchText.myU"]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"QZ.UITouchText.home"
                                                                object:nil userInfo:nil];
            
        }
    } else {
      QZLog(@"你的手机暂不支持3D Touch!");
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
