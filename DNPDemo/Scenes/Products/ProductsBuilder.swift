//
//  ProductsBuilder.swift
//  DNPDemo
//
//  Created by Bruce McTigue on 12/25/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Tiguer

enum Products {
    final class Builder: VCBuilder {
        
        static let cacheKey = "products"
        
        private var store: StoreProtocol
        private lazy var dataAdapter = Products.UnboxDataAdapter<Product>()
        private lazy var service = Products.Service<Product, Products.UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Products.Builder.cacheKey)
        private lazy var presenter = Products.Presenter<Product, Products.ViewModel>([])
        private lazy var interactor = Products.Interactor<Product, Products.Presenter, Products.Service>(presenter, service: service)
        private lazy var collectionViewController = ProductsCollectionViewController(with: interactor, presenter: presenter)
        
        init(store: StoreProtocol) {
            self.store = store
        }
        
        func run(completionHandler: VCBuilderBlock) {
            let controller = ProductsViewController(with: collectionViewController)
            completionHandler(controller)
        }
    }
}
