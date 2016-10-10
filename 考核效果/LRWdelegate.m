//
//  LRWdelegate.m
//  考核效果
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 *  这是考试
 *
 *  @param BOOL <#BOOL description#>
 *
 *  @return <#return value description#>
 */
#import "LRWdelegate.h"
#import "root.h"

@implementation LRWdelegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    root *rootvc =[[root alloc]init];
    self.window =[[UIWindow alloc]init];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:rootvc];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0 green:158/255.0 blue:214/255.0 alpha:1]];
//    NSLog(@"%lf",nav.navigationBar.bounds.size.height);
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
