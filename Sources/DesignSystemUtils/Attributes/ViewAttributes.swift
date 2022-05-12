//
//  ViewAttributes.swift
//
//
//  Created by Karolina Samorek on 21/04/2022.
//

import CoreGraphics
import Foundation

/// UI Attributes that can be applied on a view to change it visually.
public struct ViewAttributes: Equatable, Hashable {
    /// View's Background Color. Wont't be set if ``nil``.
    public var backgroundColor: DSColor?
    /// View's Tint Color. Wont't be set if ``nil``.
    public var tintColor: DSColor?
    /// Attributes applied to view's border. Wont't be set if ``nil``.
    public var borderAttributes: BorderAttributes?
    /// View's corner radius. Wont't be set if ``nil``.
    public var cornerRadius: CGFloat?
    /// Attributes related to view's shadow. Wont't be set if ``nil``.
    public var shadowAttributes: ShadowAttributes?

    /// Creates UI Attributes that can be applied on a view to change it visually.
    /// - Parameters:
    ///   - backgroundColor: View's Background Color. Wont't be set if ``nil``.
    ///   - tintColor: View's Tint Color. Wont't be set if ``nil``.
    ///   - borderAttributes: Attributes applied to view's border. Wont't be set if ``nil``.
    ///   - cornerRadius: View's corner radius. Wont't be set if ``nil``.
    ///   - shadowAttributes: Attributes related to view's shadow. Wont't be set if ``nil``.
    public init(
        backgroundColor: DSColor? = nil,
        tintColor: DSColor? = nil,
        borderAttributes: BorderAttributes? = nil,
        cornerRadius: CGFloat? = nil,
        shadowAttributes: ShadowAttributes? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.borderAttributes = borderAttributes
        self.cornerRadius = cornerRadius
        self.shadowAttributes = shadowAttributes
    }
}
