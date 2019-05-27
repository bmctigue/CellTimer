//
//  ProductsCollectionViewController.swift
//  CellTimer
//
//  Created by Bruce McTigue on 4/6/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer


class ProductsCollectionViewController: UIViewController {
    
    typealias ViewModel = Products.ViewModel
    
    let cellName = "ProductCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModels = [ViewModel]()
    var collectionViewDatasource: CollectionViewDataSource<ViewModel>?
    var productColors = [String: UIColor]()
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
        self.collectionView.delegate = self
        self.addDataSource()
        
        NotificationCenter.default.addObserver(self, selector:  #selector(deviceDidRotate), name: UIApplication.didChangeStatusBarOrientationNotification, object: nil)
        
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
        if productColors.isEmpty {
            self.productColors = generateProductColors(models)
        }
        for model in models {
            collectionView.register(UINib(nibName:cellName, bundle: nil), forCellWithReuseIdentifier: "\(model)")
        }
        self.collectionViewDatasource?.models = models
        self.collectionView.reloadData()
    }
    
    func updateFilterState(_ state: ProductFilterState) {
        presenter.filterModelsByState(state)
    }
    
    @objc func deviceDidRotate() {
        self.updateCollectionScrollDirection()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}
