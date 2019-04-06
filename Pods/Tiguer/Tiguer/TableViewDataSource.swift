//
//  TableViewDataSource.swift
//  Tiguer
//
//  Created by John Sundell on 1/2/19.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

public class TableViewDataSource<Model>: NSObject, UITableViewDataSource {
    
    public typealias CellConfigurator = (Model, UITableViewCell) -> Void
    
    public var models: [Model]
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    public init(models: [Model],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        )
        
        cellConfigurator(model, cell)
        
        return cell
    }
}
