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
    
    lazy var selectedButton = UIBarButtonItem(title: "Purchased", style: .plain, target: self, action: #selector(selectedButtonPressed(_:)))
    
    lazy var infoButton = UIBarButtonItem(image: UIImage(named: "cog"), style: .plain, target: self, action: #selector(infoButtonPressed(_:)))
    
    var filterState: ProductFilterState = .all
    var collectionViewController: ProductsCollectionViewController
    
    init(with collectionViewController: ProductsCollectionViewController) {
        self.collectionViewController = collectionViewController
        super.init(nibName: nil, bundle: nil)
        self.title = "TopHatter"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.setStatusBarStyle(.lightContent)
        selectedButton.tintColor = ProductsViewController.controlsColor
        infoButton.tintColor = ProductsViewController.controlsColor
        self.navigationItem.rightBarButtonItem = selectedButton
        self.navigationItem.leftBarButtonItem = infoButton
        add(collectionViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}
