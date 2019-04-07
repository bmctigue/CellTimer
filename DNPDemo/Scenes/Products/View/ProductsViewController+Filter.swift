//
//  MoviesViewController+Filter.swift
//  TMDB
//
//  Created by Bruce McTigue on 1/9/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

extension ProductsViewController {
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        self.filterState = filterState == .all ? .connected : .all
        filterStateChanged(filterState)
    }
    
    func filterStateChanged(_ state: ProductFilterState) {
        collectionViewController.updateFilterState(state)
        switch state {
        case .all:
            connectedButton.title = "Connected"
        case .connected:
            connectedButton.title = "All"
        }
    }
}
