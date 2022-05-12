//
//  ShadowAttributes.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

import CoreGraphics

/// UI Attributes that related to view's shadow. When applied change view's shadow visually.
public struct ShadowAttributes: Equatable, Hashable {
    /// View's Shadow color.
    public var color: DSColor
    /// View's Shadow radius.
    public var radius: CGFloat
    /// View's Shadow opacity.
    public var opacity: Float
    /// View's Shadow offset.
    public var offset: CGSize

    /// Creates UI Attributes that related to view's shadow. When applied change view's shadow visually.
    /// - Parameters:
    ///   - color: View's Shadow color.
    ///   - radius: View's Shadow radius.
    ///   - opacity: View's Shadow opacity.
    ///   - offset: View's Shadow offset. Defaults to ``.zero``.
    public init(color: DSColor, radius: CGFloat, opacity: Float, offset: CGSize = .zero) {
        self.color = color
        self.radius = radius
        self.opacity = opacity
        self.offset = offset
    }
}
