//
//  ProductsPresenter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/31/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension Products {
    final class Presenter<Model, ViewModel>: Tiguer.Presenter<Model, ViewModel> {
        
        typealias ProductViewModel = Products.ViewModel
        
        private var filterState: ProductFilterState = .all
        private lazy var connectedManager = Products.SelectionManager<Product>()
        private lazy var productStateHash = [String:ProductState]()
        
        private lazy var stateHashQueue = DispatchQueue(label: "ProductStateHash")
        
        override var baseViewModels: [ViewModel] {
            var resultModels = [ViewModel]()
            let productModels = models as! [Product]
            for model in productModels {
                let displayedModel = Products.ViewModel(productId: model.productId, name: model.name, text: model.text)
                resultModels.append(displayedModel as! ViewModel)
                updateProductState(model.productId, state: .bid)
            }
            return resultModels
        }
        
        override func updatedViewModels(completionHandler: @escaping ([ViewModel]) -> Void) {
            background.dispatch { [weak self] in
                if let self = self {
                    var resultModels = self.viewModels
                    var selected: Set<String>
                    if self.filterState == .selected {
                        selected = self.getPurchased()
                    } else {
                        selected = self.getAvailable()
                    }
                    resultModels = resultModels.filter {
                        let model = $0 as! ProductViewModel
                        return selected.contains(model.selectionId)
                    }
                    
                    resultModels = resultModels.map { [weak self] in
                        let model = $0 as! ProductViewModel
                        model.productState = self?.getProductState(model.productId) ?? .bid
                        return model as! ViewModel
                    }
                    
                    self.main.dispatch {
                        completionHandler(resultModels)
                    }
                }
            }
        }
    }
}

extension Products.Presenter {
    func filterModelsByState(_ state: ProductFilterState) {
        self.filterState = state
        self.updateViewModelsInBackground()
    }
    
    func getPurchased() -> Set<String> {
        var purchased = Set<String>()
        for (key,value) in productStateHash {
            if value == .sold {
                purchased.insert(key)
            }
        }
        return purchased
    }
    
    func getAvailable() -> Set<String> {
        var available = Set<String>()
        for (key,value) in productStateHash {
            if value != .sold {
                available.insert(key)
            }
        }
        return available
    }
    
    func updateProductState(_ modelId: String, state: ProductState) {
        stateHashQueue.async { [weak self] in
            self?.productStateHash[modelId] = state
        }
    }
    
    func getProductState(_ modelId: String) -> ProductState? {
        var state: ProductState?
        stateHashQueue.sync {
            state = productStateHash[modelId]
        }
        return state
    }
}
