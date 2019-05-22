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
        self.collectionViewDatasource = CollectionViewDataSource(models: viewModels) { (model: ViewModel, cell: UICollectionViewCell) in
            let cell = cell as! ProductCell
            cell.productId = model.productId
            cell.nameLabel.text = model.name
            cell.nameView.backgroundColor = self.productColors[model.productId]
            cell.productState = model.productState
            cell.progressView.progress = model.productId == cell.productId ? model.dynamicProgress.value : 1.0
            
            cell.dynamicState.addSoloObserver(self) { [weak cell, weak model] in
                if let state = cell?.dynamicState.value {
                    model?.goToNextState(state)
                }
            }
            model.dynamicState.addSoloObserver(self) { [weak cell, weak model] in
                cell?.productState = model?.dynamicState.value
            }
            
            model.dynamicProgress.addSoloObserver(self) { [weak cell, weak model] in
                if let progress = model?.dynamicProgress.value {
                    cell?.progressView.progress = progress
                }
            }
        }
        self.collectionView.dataSource = collectionViewDatasource
    }
}

class CollectionViewDataSource<Model>: NSObject, UICollectionViewDataSource {
    
    public typealias CellConfigurator = (Model, UICollectionViewCell) -> Void
    
    public var models: [Model]
    private let cellConfigurator: CellConfigurator
    
    public init(models: [Model], cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.cellConfigurator = cellConfigurator
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(model)",
            for: indexPath
        )
        
        cellConfigurator(model, cell)
        return cell
    }
}
