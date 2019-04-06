//
//  Enumerations.swift
//  Tiguer
//
//  Created by Bruce McTigue on 1/1/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

public enum TestingState {
    case testing
    case notTesting
}

public enum StoreError: Error {
    case fetchDataFailed
    case invalidUrl
}

public enum Store {
    public enum Result {
        case success(Data)
    }
}

public enum DataAdapterError: Error {
    case conversionFailed
}

public enum DataAdapterResult {
    public enum Result<Model> {
        case success([Model])
    }
}

public enum SelectionState: Equatable {
    case selected(String)
    case unSelected(String)
}
