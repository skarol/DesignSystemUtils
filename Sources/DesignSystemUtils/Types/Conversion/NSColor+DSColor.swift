//
//  NSColor+DSColor.swift
//
//
//  Created by Karolina Samorek on 12/05/2022.
//

#if canImport(AppKit)

import AppKit

public extension NSColor {
    /// Creates ``NSColor`` instance from Design System specific color.
    ///
    /// Supports light color scheme only.
    /// - Parameter dsColor: The Design System specific color
    convenience init(dsColor: DSColor) {
        self.init(cgColor: dsColor.light)!
    }
}

#endif
