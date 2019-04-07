//
//  ProductsCollectionViewController+FlowLayout.swift
//  DNPDemo
//
//  Created by Bruce McTigue on 4/6/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

let padding = 20.0
let defaultWidth = CGFloat(50.0)
let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)

extension ProductsCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        var width: CGFloat
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if screenHeight >= screenWidth {
                width = ((screenWidth - CGFloat(padding * 3))/2.0)
            } else {
                width = screenHeight - CGFloat(padding * 2)
            }
        case .pad:
            width = 200.0
        case .unspecified:
            width = defaultWidth
        case .tv:
            width = defaultWidth
        case .carPlay:
            width = defaultWidth
        @unknown default:
            width = 200.0
        }
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
