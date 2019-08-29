//
//  UnboxDataAdapter.swift
//  CellTimer
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Unbox
import Promis
import Tiguer

extension Products {
    final class UnboxDataAdapter<Model: Unboxable>: Tiguer.DataAdapter<Model> {
        
        override func itemsFromData(_ data: Data) -> Future<DataAdapterResult.Result<Model>> {
            let promise = Promise<DataAdapterResult.Result<Model>>()
            do {
                let models: [Model] = try unbox(data: data)
                promise.setResult(DataAdapterResult.Result.success(models))
            } catch {
                promise.setError(DataAdapterError.conversionFailed)
            }
            return promise.future
        }
    }
}
