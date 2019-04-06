//
//  SelectionManager.swift
//  Tiguer
//
//  Created by Bruce McTigue on 2/26/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

extension Tiguer {
    open class SelectionManager<Model> {
        
        typealias CacheObject = Set<String>
        
        let selectionKey = "\(Model.self)"
        
        private var selections: CacheObject = []
        private lazy var cache = BaseCache<CacheObject>()
        
        public init() {
            cache.getObjectForKey(selectionKey) { [weak self] (object: CacheObject?) in
                self?.selections = object ?? []
            }
        }
        
        open func updateSelections(_ state: SelectionState) {
            switch state {
            case .selected(let selectionId):
                selections.insert(selectionId)
            case .unSelected(let selectionId):
                selections.remove(selectionId)
            }
            cache.setObject(selections, forKey: selectionKey)
        }
        
        open func getSelections() -> Set<String> {
            return selections
        }
    }
}
