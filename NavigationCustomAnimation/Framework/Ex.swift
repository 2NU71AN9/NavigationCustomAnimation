//
//  Ex.swift
//  NavigationCustomAnimation
//
//  Created by Kevin on 2019/8/30.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

public extension UIViewControllerContextTransitioning {
    
    var fromVC: UIViewController {
        return viewController(forKey: .from) ?? UIViewController()
    }
    var toVC: UIViewController {
        return viewController(forKey: .to) ?? UIViewController()
    }
    var fromView: UIView {
        return view(forKey: .from) ?? UIView()
    }
    var toView: UIView {
        return view(forKey: .to) ?? UIView()
    }
}

@objc
public extension UINavigationController {
    func sl_pushViewController(_ viewController: UIViewController, tableView: UITableView? = nil, animated: Bool) {
    }
}
