//
//  DataAdapter.swift
//  Tiguer
//
//  Created by Bruce McTigue on 2/13/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation
import Promis

extension Tiguer {
    open class DataAdapter<Model>: DataAdapterProtocol {
        
        public init() {}
        
        open func itemsFromData(_ data: Data) -> Future<DataAdapterResult.Result<Model>> {
            assert(false, "DataAdapter itemsFromData is not implemented")
            let promise = Promise<DataAdapterResult.Result<Model>>()
            do {
                let results = [Model]()
                promise.setResult(.success(results))
            }
            return promise.future
        }
    }
}
