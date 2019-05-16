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
            cell.selectedState = self.presenter.getConnected().contains(model.selectionId) ? SelectionState.selected(model.selectionId) : SelectionState.unSelected(model.selectionId)
            cell.dynamicSelectedState.addObserver(self) {
                if let state = cell.dynamicSelectedState.value {
                    self.presenter.updateConnected(state)
                }
            }
        }
        self.collectionView.dataSource = collectionViewDatasource
    }
}
