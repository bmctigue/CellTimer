//
//  UserDefaults+Storage.swift
//  Tiguer
//
//  Created by Bruce McTigue on 4/2/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func save<T:Encodable>(customObject object: T, inKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            self.set(encoded, forKey: key)
        }
    }
    
    func retrieve<T:Decodable>(object type:T.Type, fromKey key: String) -> T? {
        if let data = self.data(forKey: key) {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(type, from: data) {
                return object
            }else {
                print("Couldnt decode object")
                return nil
            }
        } else {
            print("Couldnt find key")
            return nil
        }
    }
    
    func delete(forKey key: String) {
        self.removeObject(forKey: key)
    }
}
