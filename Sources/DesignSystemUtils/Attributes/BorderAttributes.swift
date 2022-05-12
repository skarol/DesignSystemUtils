//
//  BorderAttributes.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

import CoreGraphics

/// UI Attributes that can be applied on a view's border to change it visually.
public struct BorderAttributes: Equatable, Hashable {
    /// View's Border width.
    public var width: CGFloat
    /// View's Border color. Wont't be set if ``nil``.
    public var color: DSColor?

    /// Creates UI Attributes that can be applied on a view's border to change it visually.
    /// - Parameters:
    ///   - width: View's Border width.
    ///   - color: View's Border color. Wont't be set if ``nil``.
    public init(width: CGFloat, color: DSColor? = nil) {
        self.color = color
        self.width = width
    }
}
