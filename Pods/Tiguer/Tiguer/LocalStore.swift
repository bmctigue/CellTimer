//
//  LocalStore.swift
//  Tiguer
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Promis

public struct LocalStore: StoreProtocol {
    
    private var assetName: String
    private var bundle: Bundle
    
    public init(_ assetName: String, bundle: Bundle = Bundle.main) {
        self.assetName = assetName
        self.bundle = bundle
    }
    
    public func fetchData(_ url: URL? = nil) -> Future<Store.Result> {
        let promise = Promise<Store.Result>()
        if let asset = NSDataAsset(name: assetName, bundle: self.bundle) {
            promise.setResult(.success(asset.data))
        } else {
            promise.setError(StoreError.fetchDataFailed)
        }
        return promise.future
    }
}
