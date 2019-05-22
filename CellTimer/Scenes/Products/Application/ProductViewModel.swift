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
    final class ViewModel: Hashable, CustomStringConvertible {
        let productId: String
        let name: String
        let text: String
        
        var timer: Timer?
        var startTime: CFTimeInterval?
        var endTime: CFTimeInterval?
        let animationDuration = 15.0
        
        private lazy var stateHashQueue = DispatchQueue(label: "ProductStateHash")
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(productId)
        }
        
        var productState: ProductState? {
            didSet {
                if let productState = productState {
                    self.dynamicState.value = productState
                }
            }
        }
        
        var progress: Float? {
            didSet {
                if let progress = progress {
                    self.dynamicProgress.value = progress
                }
            }
        }
        
        var description: String {
            return "\(name), \(productId)"
        }
        
        lazy var dynamicProgress: DynamicValue<Float> = DynamicValue(progress ?? 1.0)
        lazy var dynamicState: DynamicValue<ProductState> = DynamicValue(productState ?? .bid)
        
        init(productId: String, name: String, text: String, state: ProductState = .bid) {
            self.productId = productId
            self.name = name
            self.text = text
            self.productState = state
            resetTimer()
        }
        
        static func == (lhs: Products.ViewModel, rhs: Products.ViewModel) -> Bool {
            return lhs.productId == rhs.productId
        }
    }
}

extension Products.ViewModel {
    func resetTimer() {
        cancelTimer()
        progress = 1.0
        if productState != .sold {
            startTime = CACurrentMediaTime()
            endTime = animationDuration + startTime!
            createTimer()
        }
    }
    
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
            if productState == .sold {
                cancelTimer()
            } else {
                progress = 1.0
                goToNextState(productState)
            }
        }
        
        progress = 1.0 - (Float(now - startTime) / Float(animationDuration))
    }
    
    func goToNextState(_ state: ProductState?) {
        if let state = state {
            switch state {
            case .bid:
                self.productState = .once
                resetTimer()
            case .once:
                self.productState = .twice
                resetTimer()
            case .twice:
                self.productState = .sold
                cancelTimer()
            case .sold:
                self.productState = .bid
                resetTimer()
            }
        }
    }
}
