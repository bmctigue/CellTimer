//
//  Interactor.swift
//  Tiguer
//
//  Created by Bruce McTigue on 2/8/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

extension Tiguer {
    open class Interactor<Model, Presenter: PresenterProtocol, Service: ServiceProtocol>: InteractorProtocol {
        
        public var presenter: Presenter
        public var service: Service
        
        public init(_ presenter: Presenter, service: Service) {
            self.service = service
            self.presenter = presenter
        }
        
        open func fetchItems(_ request: Request, url: URL?) {
            service.fetchItems(request, url: url) { [weak self] models in
                let models = models as! [Presenter.Model]
                if let self = self {
                    let response = Response(models)
                    self.presenter.updateViewModels(response)
                }
            }
        }
    }
}
