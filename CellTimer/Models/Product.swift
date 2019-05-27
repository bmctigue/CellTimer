//
//  Product.swift
//  CellTimer
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Unbox

struct Product: Codable {
    var productId: String
    var name: String
    var text: String
}

extension Product: Unboxable {
    init(unboxer: Unboxer) throws {
        self.productId = try unboxer.unbox(key: "id")
        self.name = try unboxer.unbox(key: "name")
        self.text = try unboxer.unbox(key: "text")
    }
}
