//
//  Color+DSColor.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

#if canImport(UIKit)

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

#elseif canImport(AppKit)

import AppKit
import SwiftUI

extension Color {
    /// Creates ``Color`` instance from Design System specific color.
    ///
    /// Supports light color scheme via only.
    /// - Parameter dsColor: The Design System specific color
    public init(dsColor: DSColor) {
        if #available(macOS 12.0, *) {
            self.init(nsColor: NSColor(dsColor: dsColor))
        } else {
            self.init(NSColor(dsColor: dsColor))
        }
    }
}

#endif
