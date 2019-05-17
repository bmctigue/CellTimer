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
            }
            return resultModels
        }
        
        override func updatedViewModels(completionHandler: @escaping ([ViewModel]) -> Void) {
            background.dispatch { [weak self] in
                if let self = self {
                    var resultModels = self.viewModels
                    
                    resultModels = resultModels.filter {
                        let model = $0 as! ProductViewModel
                        return self.filterState == .selected ? model.productState == .sold : model.productState != .sold
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
}
