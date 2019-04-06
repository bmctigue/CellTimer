//
//  Structs.swift
//  Tiguer
//
//  Created by Bruce McTigue on 1/1/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

public struct Request {
    public var params: [String: String]
    public init(_ params: [String: String] = [:]) {
        self.params = params
    }
}

public struct Response<Model> {
    public var models: [Model]
    public init(_ models: [Model]) {
        self.models = models
    }
}

public struct SampleViewModel {
    let sampleId: Int
    init(sampleId: Int) {
        self.sampleId = sampleId
    }
}
