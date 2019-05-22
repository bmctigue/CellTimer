//
//  BlueColorTheme.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 1/4/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import ChameleonFramework

final class BlueColorTheme: ColorTheme {
    func primaryColor() -> UIColor {
        return FlatSkyBlueDark()
    }
    
    func secondaryColor() -> UIColor {
        return FlatWhite()
    }
}
