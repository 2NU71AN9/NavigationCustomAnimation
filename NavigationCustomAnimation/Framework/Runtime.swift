//
//  Runtime.swift
//  adsda
//
//  Created by Kevin on 2019/8/31.
//  Copyright © 2019 cn. All rights reserved.
//

import UIKit

public extension UIViewController {
    private static let animationEnableKey = UnsafeRawPointer(bitPattern:"animationEnableKey".hashValue)!
    
    @objc
    var animationEnable: Bool {
        get {
            return objc_getAssociatedObject(self, UIViewController.animationEnableKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, UIViewController.animationEnableKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            navigationController?.animationEnable = newValue
        }
    }
}
