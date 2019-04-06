//
//  UITableView+ScrollToTop.swift
//  Tiguer
//
//  Created by Bruce McTigue on 1/8/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
    
    public func scroll(to: ScrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) { [weak self] in
            let numberOfSections = self?.numberOfSections ?? 0
            let numberOfRows = self?.numberOfRows(inSection: numberOfSections-1) ?? 0
            switch to {
            case .top:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: 0, section: 0)
                    self?.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self?.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
            }
        }
    }
    
    public enum ScrollsTo {
        case top, bottom
    }
}
