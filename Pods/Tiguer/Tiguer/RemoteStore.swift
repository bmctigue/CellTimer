//
//  RemoteStore.swift
//  Tiguer
//
//  Created by Bruce McTigue on 2/8/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation
import Promis

public struct RemoteStore: StoreProtocol {
    
    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func fetchData(_ url: URL?) -> Future<Store.Result> {
        let promise = Promise<Store.Result>()
        
        if let url = url {
            let postData = NSData(data: "{}".data(using: String.Encoding.utf8)!)
            
            let urlRequest = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            urlRequest.httpMethod = "GET"
            urlRequest.httpBody = postData as Data
            let dataTask = session.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, _, error) -> Void in
                DispatchQueue.main.async {
                    if error == nil {
                        if let data = data {
                            promise.setResult(.success(data))
                        } else {
                            promise.setError(StoreError.fetchDataFailed)
                        }
                    } else {
                        promise.setError(StoreError.fetchDataFailed)
                    }
                }
            })
            dataTask.resume()
        } else {
            promise.setError(StoreError.invalidUrl)
        }
        return promise.future
    }
}
