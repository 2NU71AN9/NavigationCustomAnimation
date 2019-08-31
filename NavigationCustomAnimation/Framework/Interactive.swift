//
//  Interactive.swift
//  NavigationCustomAnimation
//
//  Created by Kevin on 2019/8/30.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

class Interactive: UIPercentDrivenInteractiveTransition {

    var isInteracting = false
    var tableView: UITableView = UITableView()
    var navigationController: UINavigationController? {
        didSet {
            containerView = navigationController?.view
        }
    }
    
    private var containerView: UIView? {
        didSet {
            containerView?.addGestureRecognizer(pan)
        }
    }
    
    private lazy var pan: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.delegate = self
        return pan
    }()
    
    private var percentBattery: CGFloat = 0
}

private extension Interactive {
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {

        guard let containerView = containerView else { return }
        
        let translation = gesture.translation(in: containerView)
        var percent = translation.y / containerView.bounds.width
        let velocityY = gesture.velocity(in: containerView).y
        
        if tableView.contentOffset.y > 0 { percentBattery = max(percent, 0) }
        percent = tableView.contentOffset.y > 0 ? 0 : max(percent, 0)
        tableView.isScrollEnabled = percent <= 0 || tableView.contentOffset.y > 0
        switch gesture.state {
        case .began:
            isInteracting = true
            if (navigationController?.viewControllers.count ?? 0) > 1 {
                pop()
            }
        case .changed:
            if isInteracting {
                update(percent - percentBattery)
                if percent >= 1 {
                    isInteracting = false
                    finish()
                }
            }
        case .cancelled:
            tableView.isScrollEnabled = true
            if isInteracting {
                isInteracting = false
                percentBattery = 0
                cancel()
            }
        case .ended:
            tableView.isScrollEnabled = true
            if isInteracting {
                isInteracting = false
                percentBattery = 0
                if percent > 0.15 && percent < 0.55 && velocityY > 200 {
                    finish()
                } else if percent >= 0.55 {
                    finish()
                } else {
                    cancel()
                }
            }
        default:
            percentBattery = 0
            tableView.isScrollEnabled = true
        }
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}

extension Interactive: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.visibleViewController?.animationEnable ?? false
    }
}
