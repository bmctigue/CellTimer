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
            
            cell.dynamicState.addObserver(self) {
                if let state = cell.dynamicState.value {
                    model.goToNextState(state)
                }
            }
            model.dynamicState.addObserver(self) {
                cell.productState = model.dynamicState.value
            }
            
            model.dynamicProgress.addObserver(self) {
                cell.progressView.progress = model.dynamicProgress.value
            }
        }
        self.collectionView.dataSource = collectionViewDatasource
    }
}
