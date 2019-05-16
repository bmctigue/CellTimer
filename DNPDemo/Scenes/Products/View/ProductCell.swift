//
//  ProductCollectionViewCell.swift
//  DNPDemo
//
//  Created by Bruce McTigue on 4/6/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer
import ChameleonFramework

class ProductCell: UICollectionViewCell {

    typealias ViewModel = Products.ViewModel
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bidButton: UIButton!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var productId: String = ""
    var selectedState: SelectionState = .unSelected("")
    
    var productState: ProductState? {
        didSet {
            if let productState = productState {
                self.productStateChanged(productState)
            }
        }
    }
    
    lazy var dynamicSelectedState: DynamicValue<SelectionState?> = DynamicValue(selectedState)
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FlatGrayDark().cgColor
        self.bidButton.layer.cornerRadius = 8.0
        self.bidButton.layer.borderWidth = 1.0
        self.bidButton.layer.borderColor = FlatGrayDark().cgColor
        self.productState = .bid
    }
    
    @IBAction func bidButtonPressed(_ sender: Any) {
        if let productState = productState {
            switch productState {
            case .bid:
                self.productState = .once
            case .once:
                self.productState = .twice
            case .twice:
                self.productState = .sold
            case .sold:
                self.productState = .bid
            }
        }
    }
    
    func productStateChanged(_ state: ProductState) {
        switch state {
        case .bid:
            progressView.progressTintColor = .flatGreen
            resetProgressView()
        case .once:
            progressView.progressTintColor = .flatOrange
            resetProgressView()
        case .twice:
            progressView.progressTintColor = .flatRed
            resetProgressView()
        case .sold:
            dynamicSelectedState.value = .selected(productId)
            bidButton.setTitle("Sell", for: .normal)
            progressView.isHidden = true
        }
    }
    
    func resetProgressView() {
        dynamicSelectedState.value = .unSelected(productId)
        bidButton.setTitle("Bid", for: .normal)
        progressView.isHidden = false
        progressView.progress = 1.0
    }
}
