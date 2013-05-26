//
//  TPAppDelegate.h
//  Trusty ProtocoliOS
//
//  Created by superCat on 25/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

// UITabBarControllerDelegate protocol
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end
