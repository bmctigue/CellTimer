//
//  MoviesViewController+Filter.swift
//  TMDB
//
//  Created by Bruce McTigue on 1/9/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

extension ProductsViewController {
    
    @IBAction func selectedButtonPressed(_ sender: Any) {
        self.filterState = filterState == .all ? .selected : .all
        filterStateChanged(filterState)
    }
    
    func filterStateChanged(_ state: ProductFilterState) {
        collectionViewController.updateFilterState(state)
        switch state {
        case .all:
            selectedButton.title = "Purchased"
        case .selected:
            selectedButton.title = "Shop"
        }
    }
}
