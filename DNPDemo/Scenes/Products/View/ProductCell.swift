//
//  ProductCollectionViewCell.swift
//  DNPDemo
//
//  Created by Bruce McTigue on 4/6/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

class ProductCell: UICollectionViewCell {

    typealias ViewModel = Products.ViewModel
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!
    
    var productId: String = ""
    
    var connectedState: SelectionState? {
        didSet {
            if let connectedState = connectedState {
                self.connectedStateChanged(connectedState)
            }
        }
    }
    
    lazy var dynamicFavoriteState: DynamicValue<SelectionState?> = DynamicValue(connectedState)
    
    override func awakeFromNib() {}
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        if let connectedState = connectedState {
            switch connectedState {
            case .selected:
                self.connectedState = .unSelected(productId)
            case .unSelected:
                self.connectedState = .selected(productId)
            }
        }
    }
    
    func connectedStateChanged(_ state: SelectionState) {
        switch state {
        case .selected(let productId):
            dynamicFavoriteState.value = .selected(productId)
            connectButton.setTitle("Disconnect", for: .normal)
        case .unSelected(let productId):
            dynamicFavoriteState.value = .unSelected(productId)
            connectButton.setTitle("Connect", for: .normal)
        }
    }
}
