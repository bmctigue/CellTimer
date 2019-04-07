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
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var nameView: UIView!
    
    var productId: String = ""
    
    var connectedState: SelectionState? {
        didSet {
            if let connectedState = connectedState {
                self.connectedStateChanged(connectedState)
            }
        }
    }
    
    lazy var dynamicConnectedState: DynamicValue<SelectionState?> = DynamicValue(connectedState)
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FlatBlack().cgColor
        self.connectButton.backgroundColor = FlatGrayDark()
        self.connectButton.layer.cornerRadius = 8.0
    }
    
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
            dynamicConnectedState.value = .selected(productId)
            connectButton.setTitle("Disconnect", for: .normal)
        case .unSelected(let productId):
            dynamicConnectedState.value = .unSelected(productId)
            connectButton.setTitle("Connect", for: .normal)
        }
    }
}
