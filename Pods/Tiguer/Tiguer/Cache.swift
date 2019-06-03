//
//  Cache.swift
//  Tiguer
//
//  Created by Bruce McTigue on 2/4/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

extension Tiguer {
    open class BaseCache<CacheObject: Codable>: CacheProtocol {
        
        private var testingState: TestingState = .notTesting
        
        public func setObject<CacheObject: Codable>(_ object: CacheObject, forKey key: String) {
            guard testingState == .notTesting else {
                return
            }
            AsyncQueue.safe.dispatch {
                UserDefaults.standard.save(customObject: (object as CacheObject), inKey: key)
            }
        }
        
        public func getObjectForKey<CacheObject>(_ key: String, completionHandler: @escaping (CacheObject?) -> ()) where CacheObject : Decodable, CacheObject : Encodable {
            SyncQueue.safe.dispatch {
                let object = UserDefaults.standard.retrieve(object: CacheObject.self, fromKey: key)
                completionHandler(object)
            }
        }
        
        public func removeObjectForKey(_ key: String) {
            AsyncQueue.safe.dispatch {
                UserDefaults.standard.delete(forKey: key)
            }
        }
        
        public func updateTestingState(_ testingState: TestingState) {
            self.testingState = testingState
        }
    }
}
