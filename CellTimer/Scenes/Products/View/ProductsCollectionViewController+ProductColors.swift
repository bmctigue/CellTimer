//
//  ProductsCollectionViewController+ProductColors.swift
//  CellTimer
//
//  Created by Bruce McTigue on 5/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import ChameleonFramework

extension ProductsCollectionViewController {
    func generateProductColors(_ models: [ViewModel]) -> [String: UIColor] {
        var colors = [String: UIColor]()
        var usedColors: Set<UIColor> = [FlatGrayDark(), FlatWhiteDark()]
        for model in models {
            var color = RandomFlatColorWithShade(.dark)
            while usedColors.contains(color) {
                color = RandomFlatColorWithShade(.dark)
            }
            usedColors.insert(color)
            colors[model.productId] = color
        }
        return colors
    }
}
