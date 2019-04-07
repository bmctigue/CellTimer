//
//  ProductsViewController.swift
//  DNPDemo
//
//  Created by Bruce McTigue on 4/6/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Tiguer

final class ProductsViewController: UIViewController {
    
    static let controlsColor = UIColor.white
    
    @IBOutlet weak var collectionViewContainerView: UIView!
    
    lazy var connectedButton = UIBarButtonItem(title: "Connected", style: .plain, target: self, action: #selector(connectButtonPressed(_:)))
    
    lazy var infoButton = UIBarButtonItem(image: UIImage(named: "Cog"), style: .plain, target: self, action: #selector(infoButtonPressed(_:)))
    
    var filterState: ProductFilterState = .all
    var collectionViewController: ProductsCollectionViewController
    
    init(with collectionViewController: ProductsCollectionViewController) {
        self.collectionViewController = collectionViewController
        super.init(nibName: nil, bundle: nil)
        self.title = "DoNotPay"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.setStatusBarStyle(.lightContent)
        connectedButton.tintColor = ProductsViewController.controlsColor
        infoButton.tintColor = ProductsViewController.controlsColor
        self.navigationItem.rightBarButtonItem = connectedButton
        self.navigationItem.leftBarButtonItem = infoButton
        add(collectionViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}
