//
//  DSColor.swift
//
//
//  Created by Karolina Samorek on 22/04/2022.
//

import CoreGraphics
import Foundation
import SwiftUI

/// Design System representation of Color.
///
/// Wraps ``CGColor`` for light and dark mode.
public struct DSColor: Equatable, Hashable {
    /// Color for light color scheme.
    public var light: CGColor { any }
    /// Color for dark color scheme.
    public let dark: CGColor?

    private let any: CGColor

    /// Creates Design System representation of Color.
    /// - Parameters:
    ///   - light: Color for light color scheme.
    ///   - dark: Color for dark color scheme.
    public init(light: CGColor, dark: CGColor) {
        any = light
        self.dark = dark
    }

    /// Creates Design System representation of Color.
    /// - Parameter any: Color for both light and dark color schemes.
    public init(_ any: CGColor) {
        self.any = any
        dark = nil
    }
}
