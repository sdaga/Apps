//
//  AppDelegate.m
//  Acronyms
//
//  Created by Mace Windu on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "AppDelegate.h"
#import "AcronymViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[AcronymViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
