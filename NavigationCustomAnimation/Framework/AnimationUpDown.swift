//
//  AnimationUpDown.swift
//  NavigationCustomAnimation
//
//  Created by Kevin on 2019/8/30.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

class AnimationUpDown: NSObject {
    private let animationTime = 0.2
    var operation = UINavigationController.Operation.none
}

extension AnimationUpDown: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        transitionContext.containerView.addSubview(transitionContext.toView)
        
        let visibleFrame = transitionContext.initialFrame(for: transitionContext.fromVC)
        let rightHiddenFrame = CGRect(origin: CGPoint(x: 0, y: visibleFrame.width) , size: visibleFrame.size)
        let leftHiddenFrame = visibleFrame
        
        transitionContext.fromView.frame = visibleFrame
        if operation == .push {
            transitionContext.toView.frame = rightHiddenFrame
        } else {
            transitionContext.toView.frame = leftHiddenFrame
            transitionContext.containerView
                .bringSubviewToFront(transitionContext.fromView)
        }
        
        UIView.animate(withDuration: animationTime, delay: 0, options: [.curveLinear], animations: { [weak self] in
            guard let weakSelf = self else { return }
            if weakSelf.operation == .pop {
                transitionContext.fromView.frame = rightHiddenFrame
            } else {
                transitionContext.toView.frame = visibleFrame
            }
        }) { (_) in
            let cancelled = transitionContext.transitionWasCancelled
            if cancelled {
                transitionContext.toView.removeFromSuperview()
            }
            transitionContext.completeTransition(!cancelled)
        }
    }
}
