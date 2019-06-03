//
//  DataDiff.swift
//  CellTimer
//
//  Created by Bruce McTigue on 6/3/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import DifferenceKit

final class CollectionViewDataDiff<ViewModel:Differentiable> {
    
    private var collectionView: UICollectionView!
    private var dataSource: CollectionViewDataSource<ViewModel>
    
    var data: [ViewModel] {
        get { return self.dataSource.models }
        set {
            let changeset = StagedChangeset(source: data, target: newValue)
            collectionView.reload(using: changeset) { updatedData in
                self.dataSource.models = updatedData
            }
        }
    }
    
    init(_ collectionView: UICollectionView, dataSource: CollectionViewDataSource<ViewModel>) {
        self.collectionView = collectionView
        self.dataSource = dataSource
    }
}
