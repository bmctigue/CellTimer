//
//  ProductViewModel.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension Products {
    final class ViewModel: Equatable {
        let productId: String
        let name: String
        let text: String
        var productState: ProductState
        
        var timer: Timer?
        var startTime: CFTimeInterval?
        var endTime: CFTimeInterval?
        let animationDuration = 15.0
        
        var selectionId: String {
            return productId
        }
        
        var progress: Float? {
            didSet {
                if let progress = progress {
                    self.dynamicProgress.value = progress
                }
            }
        }
        
        lazy var dynamicProgress: DynamicValue<Float> = DynamicValue(progress ?? 1.0)
        
        init(productId: String, name: String, text: String, state: ProductState = .bid) {
            self.productId = productId
            self.name = name
            self.text = text
            self.productState = state
            resetTimer()
        }
        
        func resetTimer() {
            progress = 1.0
            startTime = CACurrentMediaTime()
            endTime = animationDuration + startTime!
            createTimer()
        }
        
        static func == (lhs: Products.ViewModel, rhs: Products.ViewModel) -> Bool {
            return lhs.productId == rhs.productId
        }
    }
}

extension Products.ViewModel {
    func createTimer() {
        if timer == nil {
            let timer = Timer(timeInterval: 0.1,
                              target: self,
                              selector: #selector(updateTimer),
                              userInfo: nil,
                              repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            
            self.timer = timer
        }
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer() {
        guard let endTime = endTime, let startTime = startTime else {
            return
        }
        
        let now = CACurrentMediaTime()
        
        if now >= endTime {
            cancelTimer()
        }
        
        progress = 1.0 - (Float(now - startTime) / Float(animationDuration))
    }
}
