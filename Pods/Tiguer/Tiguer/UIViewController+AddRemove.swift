//
//  UIViewController+AddRemove.swift
//  Tiguer
//
//  Created by John Sundell on 1/2/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

extension UIViewController {
    public func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    public func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
