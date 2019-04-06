//
//  AppDelegate.swift
//  DNPDemo
//
//  Created by Bruce McTigue on 4/5/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let appBuilder = Builder.App(with: window)
        appBuilder.run()
        return true
    }
}

