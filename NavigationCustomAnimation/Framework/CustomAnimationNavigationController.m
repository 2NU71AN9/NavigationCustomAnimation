//
//  CustomAnimationNavigationController.m
//  adsda
//
//  Created by Kevin on 2019/8/31.
//  Copyright © 2019 cn. All rights reserved.
//

#import "CustomAnimationNavigationController.h"

@interface CustomAnimationNavigationController ()

@property (nonatomic, retain) CustomNavigationControllerDelegate * customDelegate;

@end

@implementation CustomAnimationNavigationController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self config];
    }
    return self;
}

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self config];
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self setCustomAnimationEnable:NO viewController:viewController tableView:nil];
    [super pushViewController:viewController animated:animated];
}

-(void)sl_pushViewController:(UIViewController *)viewController tableView:(UITableView *)tableView animated:(BOOL)animated {
    [self setCustomAnimationEnable:YES viewController:viewController tableView:tableView];
    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated {
    self.delegate = self.visibleViewController.animationEnable ? _customDelegate : nil;
    return [super popViewControllerAnimated:animated];
}

- (void)config {
    _customDelegate = [[CustomNavigationControllerDelegate alloc]init];
}

-(void)setCustomAnimationEnable: (BOOL)enable viewController: (UIViewController *)viewController tableView: (UITableView *)tableView {
    viewController.animationEnable = enable;
    _customDelegate.tableView = tableView;
    if (enable) {
        [self setNavigationBarHidden:YES];
        self.delegate = _customDelegate;
    } else {
        self.delegate = nil;
    }
}

@end
