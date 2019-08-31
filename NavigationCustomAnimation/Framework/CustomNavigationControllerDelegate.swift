//
//  CustomNavigationControllerDelegate.swift
//  NavigationCustomAnimation
//
//  Created by Kevin on 2019/8/30.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

@objc
class CustomNavigationControllerDelegate: NSObject {
    @objc
    weak var tableView: UITableView? {
        didSet {
            guard let tableView = tableView else { return }
            interactive.tableView = tableView
        }
    }
    private let animation = AnimationUpDown()
    private let interactive = Interactive()
}

extension CustomNavigationControllerDelegate: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animation.operation = operation
        return animation
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        interactive.navigationController = navigationController
        return interactive.isInteracting ? interactive : nil
    }
}
