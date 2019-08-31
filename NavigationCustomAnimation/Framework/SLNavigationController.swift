//
//  SLNavigationController.swift
//  NavigationCustomAnimation
//
//  Created by Kevin on 2019/8/30.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

class SLNavigationController: UINavigationController {
    
    private var customDelegate = CustomNavigationControllerDelegate()
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        setEnable(false, viewController: viewController)
        super.pushViewController(viewController, animated: animated)
    }
    
    override func sl_pushViewController(_ viewController: UIViewController, tableView: UITableView? = nil, animated: Bool) {
        setEnable(true, viewController: viewController, tableView: tableView)
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        delegate = (visibleViewController?.animationEnable ?? false) ? customDelegate : nil
        return super.popViewController(animated: animated)
    }
}

private extension SLNavigationController {
    func setEnable(_ enable: Bool, viewController: UIViewController, tableView: UITableView? = nil) {
        viewController.animationEnable = enable
        customDelegate.tableView = tableView
        if enable {
            isNavigationBarHidden = true
            delegate = customDelegate
        } else {
            delegate = nil
        }
    }
}
