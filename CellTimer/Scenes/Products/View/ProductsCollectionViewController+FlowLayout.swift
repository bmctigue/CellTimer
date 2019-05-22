//
//  ProductsCollectionViewController+FlowLayout.swift
//  CellTimer
//
//  Created by Bruce McTigue on 4/6/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

let padding = 20.0
let defaultWidth = CGFloat(200.0)
let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)

extension ProductsCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = collectionView.bounds.width
        let screenHeight = collectionView.bounds.height
        
        var width: CGFloat = defaultWidth
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            if Tiguer.DeviceInfo.Orientation.isLandscape {
                width = screenHeight - 44.0 - CGFloat(padding * 2)
            } else {
                width = ((screenWidth - CGFloat(padding * 3))/2.0)
            }
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
    
    func updateCollectionScrollDirection() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            if UIDevice.current.userInterfaceIdiom == .phone && Tiguer.DeviceInfo.Orientation.isLandscape {
                layout.scrollDirection = .horizontal
            } else {
                layout.scrollDirection = .vertical
            }
        }
    }
}
