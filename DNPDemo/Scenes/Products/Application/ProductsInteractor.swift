//
//  ProductsInteractor.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Tiguer

extension Products {
    final class Interactor<Model, Presenter: PresenterProtocol, Service: ServiceProtocol>: Tiguer.Interactor<Model, Presenter, Service> {}
}
