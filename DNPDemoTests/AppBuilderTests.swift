//
//  AppBuilderTests.swift
//  DNPDemoTests
//
//  Created by Bruce McTigue on 4/5/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import XCTest
@testable import DNPDemo
@testable import Tiguer

class AppBuilderTests: XCTestCase {
    
    var buildersCount = 0
    
    func testAppBuilder() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let builder = App.Builder(with: window)
        builder.run()
        XCTAssert(builder.getWindow() != nil)
    }
    
    func testGetWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let builder = App.Builder(with: window)
        let testWindow = builder.getWindow()!
        XCTAssert(testWindow.isKind(of: UIWindow.self))
    }
}
