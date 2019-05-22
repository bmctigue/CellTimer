//
//  ProductsService.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Promis
import Tiguer

extension Products {
    final class Service<Model: Codable, Adapter: DataAdapterProtocol>: Tiguer.Service<Model, Adapter> {}
}
