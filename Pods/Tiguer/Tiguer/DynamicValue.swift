//
//  DynamicValue.swift
//  Tiguer
//
//  Created by Bruce McTigue on 12/25/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

public typealias CompletionHandler = (() -> Void)

public class DynamicValue<T> {
    
    public var value: T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        weak var weakObserver = observer
        if let description = weakObserver?.description {
            observers[description] = completionHandler
        }
    }
    
    public func addSoloObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.dispose()
        self.addObserver(observer, completionHandler: completionHandler)
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    public func dispose() {
        observers.removeAll()
    }
    
    private func notify() {
        observers.forEach({ $0.value() })
    }
    
    deinit {
        dispose()
    }
}
