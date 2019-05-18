//
//  ProductsCollectionViewController+DataSource.swift
//  TMDB
//
//  Created by Bruce McTigue on 2/26/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension ProductsCollectionViewController {
    func addDataSource() {
        self.collectionViewDatasource = CollectionViewDataSource(models: viewModels, reuseIdentifier: cellName) { (model: ViewModel, cell: UICollectionViewCell) in
            let cell = cell as! ProductCell
            cell.productId = model.productId
            cell.nameLabel.text = model.name
            cell.nameView.backgroundColor = self.productColors[model.productId]
            cell.productState = model.productState
            cell.progressView.progress = model.dynamicProgress.value
            
            cell.dynamicState.addSoloObserver(self) { [weak cell, weak model] in
                if let state = cell?.dynamicState.value {
                    model?.goToNextState(state)
                }
            }
            model.dynamicState.addSoloObserver(self) { [weak cell, weak model] in
                if cell?.productId == model?.productId {
                    cell?.productState = model?.dynamicState.value
                }
            }
            
            model.dynamicProgress.addSoloObserver(self) { [weak cell, weak model] in
                if cell?.productId == model?.productId {
                    if let progress = model?.dynamicProgress.value {
                        cell?.progressView.progress = progress
                        print("cell id: \(String(describing: cell?.productId)), model: \(String(describing: model?.productId))")
                    }
                }
            }
        }
        self.collectionView.dataSource = collectionViewDatasource
    }
}
