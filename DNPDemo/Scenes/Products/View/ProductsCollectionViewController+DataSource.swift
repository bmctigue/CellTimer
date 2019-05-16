//
//  MoviesTableViewController+DataSource.swift
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
            print("cell: \(model.name), state: \(model.productState)")
            cell.productId = model.selectionId
            cell.nameLabel.text = model.name
            cell.nameView.backgroundColor = self.productColors[model.selectionId]
            cell.productState = self.presenter.getProductState(model.productId)
            cell.progressView.progress = model.dynamicProgress.value
            cell.dynamicProductState.addObserver(self) {
                if let state = cell.dynamicProductState.value {
                    self.presenter.updateProductState(model.productId, state: state)
                    if state == .sold {
                        model.cancelTimer()
                    } else {
                        model.resetTimer()
                    }
                }
            }
            model.dynamicProgress.addObserver(self) {
                let progress = model.dynamicProgress.value
                if progress <= 0 {
                    cell.goToNextProductState()
                } else {
                    cell.progressView.progress = progress
                }
            }
        }
        self.collectionView.dataSource = collectionViewDatasource
    }
}
