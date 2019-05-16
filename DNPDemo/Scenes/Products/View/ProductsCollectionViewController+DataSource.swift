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
            cell.productId = model.selectionId
            cell.nameLabel.text = model.name
            cell.nameView.backgroundColor = self.productColors[model.selectionId]
            cell.productState = model.productState
            cell.dynamicProductState.addObserver(self) {
                if let state = cell.dynamicProductState.value {
                    self.presenter.updateProductState(model.productId, state: state)
                }
            }
        }
        self.collectionView.dataSource = collectionViewDatasource
    }
}
