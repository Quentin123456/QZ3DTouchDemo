//
//  QZTabBarController.m
//  QZ3DTouchDemo
//
//  Created by 臧乾坤 on 2017/10/17.
//  Copyright © 2017年 Quentin Zang. All rights reserved.
//

#import "QZTabBarController.h"
#import "QZNavigationController.h"
#import "QZHomeViewController.h"
#import "QZAreaViewController.h"
#import "QZShoppingCartController.h"
#import "QZSearchController.h"
#import "QZMineUViewController.h"

@interface QZTabBarController ()<UITabBarControllerDelegate>

@end

@implementation QZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //添加子控制器
    [self addAllChildVcs];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationShortcutItemResponse) name:@"QZ.UITouchText.home" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationShortcutItemResponse) name:@"QZ.UITouchText.search" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationShortcutItemResponse) name:@"QZ.UITouchText.cart" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationShortcutItemResponse) name:@"QZ.UITouchText.myU" object:nil];
    
}

/**
 * 添加子控制器
 */
- (void)addAllChildVcs
{
    //添加首页控制器
    QZHomeViewController * home = [[QZHomeViewController alloc] init];
    [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    //添加我的专区控制器   目前不跳转
    QZAreaViewController * areaController = [[QZAreaViewController alloc] init];
    
    [self addOneChildVc:areaController title:@"我的专区" imageName:@"tabbar_area" selectedImageName:@"tabbar_area_selected"];
    QZShoppingCartController * shoppingCart = [[QZShoppingCartController alloc] init];
    [self addOneChildVc:shoppingCart title:@"购物车" imageName:@"tabbar_shoppingcart" selectedImageName:@"tabbar_shoppingcart_selected"];
    
    //添加我的U 控制器
    QZMineUViewController * mineU = [[QZMineUViewController alloc] init];
    
    [self addOneChildVc:mineU title:@"我的U" imageName:@"tabbar_mine" selectedImageName:@"tabbar_mine_selected"];
    
}

/*
 *  添加一个子控制器
 *  @param childVc              子控制器对象
 *  @param title                标题
 *  @param imageName            常态图片
 *  @param selectedIamgeName    选中状态图片
 */
- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    if ([title isEqualToString:@""]) {
        
        childVc.view.backgroundColor = [UIColor orangeColor];
        
    }
    //同时   设置 tabBarItem  和 navigationItem 标题
    childVc.title = title;
    
    //设置常态的图片
    if (![imageName isEqualToString:@""]) {
        
        childVc.tabBarItem.image = [UIImage imageWithName:imageName];
        
    }
    //设置常态的字体字号 、颜色
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置选中的字体颜色
    NSMutableDictionary * SelectTextAttrs = [NSMutableDictionary dictionary];
    SelectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:SelectTextAttrs forState:UIControlStateSelected];
    
    //设置选中状态的图片
    UIImage * selectedImage;
    if (![selectedImageName isEqualToString:@""])
    {
        selectedImage =  [UIImage imageWithName:selectedImageName];
    }
    //在选中时，要想显示原图，就必须得告诉电脑，不要渲染
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBar.tintColor = [UIColor colorWithRed:255/255 green:138/255 blue:0/255 alpha:1];
    QZNavigationController * nav = [[QZNavigationController alloc] initWithRootViewController:childVc];
    
    //添加控制器到TabBar控制器
    [self addChildViewController:nav];
}



// 3DTouch
- (void)applicationShortcutItemResponse {
    
    QZNetCountManager * sharedNetCountManager = [QZNetCountManager sharedNetCountManager];
    //首页
    if([ sharedNetCountManager.applicationShortcutItemTitle isEqualToString:@"QZ.UITouchText.home"]) {
        
        self.selectedIndex = 0;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UITouchText.home" object:nil userInfo:nil];
        
    }
    //搜索商品
    if([ sharedNetCountManager.applicationShortcutItemTitle isEqualToString:@"QZ.UITouchText.search"]) {
        self.selectedIndex = 0;
        
        QZSearchController * searchController = [[QZSearchController alloc] init];
        searchController.navigationItem.title = @"搜索";
        QZLog(@"self.selectedViewController  %@", self.selectedViewController.childViewControllers[0]);
        [self.selectedViewController.childViewControllers[0].navigationController pushViewController:searchController animated:YES];
        
    }
    //购物车
    if([sharedNetCountManager.applicationShortcutItemTitle isEqualToString:@"QZ.UITouchText.cart"]) {
        
        self.selectedIndex = 2;
        
    }
    //我的 U
    if([ sharedNetCountManager.applicationShortcutItemTitle isEqualToString:@"QZ.UITouchText.myU"]) {
        
        self.selectedIndex = 3;
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
