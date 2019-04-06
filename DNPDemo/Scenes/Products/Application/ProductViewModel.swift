//
//  ProductViewModel.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Products {
    struct ViewModel: Equatable {
        let productId: String
        let name: String
        let text: String
        
        var selectionId: String {
            return productId
        }
        
        static func == (lhs: Products.ViewModel, rhs: Products.ViewModel) -> Bool {
            return lhs.productId == rhs.productId
        }
    }
}
