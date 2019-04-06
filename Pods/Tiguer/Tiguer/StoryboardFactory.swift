//
//  StoryboardFactory.swift
//  Tiguer
//
//  Created by Bruce McTigue on 11/30/16.
//  Copyright © 2016 tiguer. All rights reserved.
//

import UIKit

public struct StoryboardFactory: StoryboardFactoryProtocol {
    
    public init() {}
    
    public func create(name: String, bundle: Bundle = Bundle.main) -> UIStoryboard {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard
    }
}
