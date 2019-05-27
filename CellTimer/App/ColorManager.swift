//
//  ColorManager.swift
//  CellTimer
//
//  Created by Bruce McTigue on 1/4/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import ChameleonFramework

final class ColorManager {
    
    private var theme: ColorTheme
    
    init(_ theme: ColorTheme) {
        self.theme = theme
        Chameleon.setGlobalThemeUsingPrimaryColor(theme.primaryColor(), withSecondaryColor: theme.secondaryColor(), andContentStyle: UIContentStyle.contrast)
    }
}

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}
