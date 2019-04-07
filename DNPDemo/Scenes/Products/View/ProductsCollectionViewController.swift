//
//  ProductsCollectionViewController.swift
//  DNPDemo
//
//  Created by Bruce McTigue on 4/6/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

class ProductsCollectionViewController: UIViewController {
    
    typealias ViewModel = Products.ViewModel
    
    let cellName = "ProductCell"
    let cellNibName = "ProductCollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModels = [ViewModel]()
    var collectionViewDatasource: CollectionViewDataSource<ViewModel>?
    lazy var loadingViewController = LoadingViewController()
    
    private var interactor: InteractorProtocol
    var presenter: Products.Presenter<Product, ViewModel>
    
    init(with interactor: InteractorProtocol, presenter: Products.Presenter<Product, ViewModel>) {
        self.interactor = interactor
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: cellName)
        
        self.addDataSource()
        
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.updateTableView(dynamicModels.value)
        }
        
        let request = Request()
        fetchItems(request: request)
    }
    
    @objc func refreshTableView() {
        let params = [Tiguer.Constants.forceKey: "true"]
        let request = Request(params)
        fetchItems(request: request)
    }
    
    func fetchItems(request: Request) {
        interactor.fetchItems(request, url: nil)
    }
    
    func updateTableView(_ models: [ViewModel]) {
        self.collectionViewDatasource?.models = models
        self.collectionView.reloadData()
    }
    
    func updateFilterState(_ state: ProductFilterState) {
        presenter.filterModelsByState(state)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}
