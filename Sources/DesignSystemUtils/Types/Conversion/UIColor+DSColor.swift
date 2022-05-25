//
//  UIColor+DSColor.swift
//
//
//  Created by Karolina Samorek on 12/05/2022.
//

#if canImport(UIKit)

import UIKit

extension UIColor {
    /// Creates ``UIColor`` instance from Design System specific color.
    ///
    /// Supports light / dark color scheme.
    /// - Parameter dsColor: The Design System specific color
    public convenience init(dsColor: DSColor) {
        if let dark = dsColor.dark {
            self.init(light: dsColor.light, dark: dark)
        } else {
            self.init(cgColor: dsColor.light)
        }
    }
}

#endif

#if canImport(UIKit) && !os(watchOS)

extension UIColor {
    private convenience init(
        light: CGColor,
        dark: CGColor
    ) {
        self.init { traitCollection  in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(cgColor: dark)
            default:
                return UIColor(cgColor: light)
            }
        }
    }
}

#elseif canImport(UIKit)

extension UIColor {
    private convenience init(
        light: CGColor,
        dark: CGColor
    ) {
        self.init(cgColor: light)
    }
}

#endif
