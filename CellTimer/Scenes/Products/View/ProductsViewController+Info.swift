//
//  ProductsViewController+Info.swift
//  CellTimer
//
//  Created by Bruce McTigue on 4/7/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

extension ProductsViewController {
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Information", message: "Select the information you need.", preferredStyle: .actionSheet)
        let tosAction = UIAlertAction(title: "TOS and Privacy Policy", style: .default) { (alert: UIAlertAction!) -> Void in
            let tosViewController = TOSViewController()
            self.present(tosViewController, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (alert: UIAlertAction!) -> Void in
            print("You pressed button cancel")
        }
        
        alert.addAction(tosAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion:nil)
    }
}
