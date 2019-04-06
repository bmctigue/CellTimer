//
//  AppBuilder.swift
//  TMDB
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Tiguer

enum App {
    final class Builder: BaseBuilder {
        
        private var window: UIWindow?
        private var builder: VCBuilder
        private var colorTheme: ColorTheme
        private var colorManager: ColorManager
        
        init(with window: UIWindow?) {
            self.window = window
            self.colorTheme = BlueColorTheme()
            self.colorManager = ColorManager(colorTheme)
            let store = LocalStore("productsJson")
            self.builder = Products.Builder(store: store)
        }
        
        func getWindow() -> UIWindow? {
            return self.window
        }
        
        func run() {
            builder.run { [weak self] viewController in
                self?.window?.rootViewController = viewController
                self?.window?.makeKeyAndVisible()
            }
        }
    }
}
