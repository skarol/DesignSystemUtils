//
//  Color+DSColor.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit
import SwiftUI

extension Color {
    /// Creates ``Color`` instance from Design System specific color.
    ///
    /// Supports light / dark color scheme via ``UIColor``.
    /// - Parameter dsColor: The Design System specific color
    public init(dsColor: DSColor) {
        if #available(iOS 15.0, tvOS 15.0, *) {
            self.init(uiColor: UIColor(dsColor: dsColor))
        } else {
            self.init(UIColor(dsColor: dsColor))
        }
    }
}

#endif
