//
//  AppDelegate.swift
//  CellTimer
//
//  Created by Bruce McTigue on 4/5/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appBuilder: App.Builder!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.appBuilder = App.Builder(with: window)
        appBuilder.run()
        return true
    }
}

